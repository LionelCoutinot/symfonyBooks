<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Author;
use DateTime;
use App\Entity\Comments;
use App\Form\CommentsType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BookController extends AbstractController
{
     /**
    * @Route("/book/{id}", name="book")
    */
    public function single(Request $request, ManagerRegistry $doctrine, $id): Response /* Les détails de chaque livre  */
    {
        $book=$doctrine->getRepository(Book::class)->find($id);   /* récupération de chaque livre dans la BDD */
        $category=$book->getCategory(); /* Récupération de la " catégorie " affiliée à chaque livre  */
        $authors=$doctrine->getRepository(Author::class)->find($id); /* Récupération de " l'auteur " ou des " auteurs"  de chaque livre  */
           
        // Partie commentaires
        // On crée le commentaire "vierge"
        $comment = new Comments;

        // On génère le formulaire
        $commentForm = $this->createForm(CommentsType::class, $comment);
        $commentForm->handleRequest($request);

        // Traitement du formulaire
        if($commentForm->isSubmitted() && $commentForm->isValid()){
            $comment->setCreatedAt(new DateTime());
            $comment->setbook($book);

            $em = $doctrine->getManager();
            $em->persist($comment);
            $em->flush();

            $this->addFlash('notice', 'Votre commentaire (et/ou votre note) a bien été enregistré !');
            return $this->redirectToRoute('app_index');
        }
        return $this->render('book/index.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
            'controller_name' => 'BookController',
            'book'=>$book,            
            'authors'=>$authors,
            'category' =>$category,
            'commentForm' => $commentForm->createView(),
        ]);

   
    }

}

