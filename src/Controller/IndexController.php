<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Book;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Knp\Component\Pager\PaginatorInterface; 


class IndexController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(Request $request, PaginatorInterface $paginator, ManagerRegistry $doctrine): Response /* Index des livres*/ 
    {
        $repository=$doctrine->getRepository(Book::class); /* Récupération dans la BBD de tous les livres*/
		 $books=$repository->findAll(); 

         $books = $paginator->paginate(
            $books, // Requête contenant les données à paginer (ici nos articles)
            $request->query->getInt('page', 1), // Numéro de la page en cours, passé dans l'URL, 1 si aucune page
            9 // Nombre de résultats par page
        );
        return $this->render('index/index.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
            'books'=>$books,
        ]);
    }
}
