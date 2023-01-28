<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Author;
use App\Repository\BookRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Knp\Component\Pager\PaginatorInterface; 

class AuthorController extends AbstractController
{
    #[Route('/author', name: 'author')]
     /**
     * @Route("/author/", name="app_author")
     */
    public function indexauthors(Request $request, ManagerRegistry $doctrine): Response /* mise en place de la page " index des auteurs " */
    {        
    $authors=$doctrine->getRepository(Author::class)->findBy(array(), /* Récupération dans la BDD de la liste des auteurs ordonnée alphabétiquement à partir de leurs noms ('lastname')  */ 
        array('lastname' => 'asc'),
        1000,
        0);

    return $this->render('author/indexauthors.html.twig', [ /* Envoi des données au fichier  template  Twig concerné */
        'controller_name' => 'AuthorController',
        'authors'=>$authors,
        ]);
    }
    
    
    /**
     * @Route("/author/{id}", name="author")
     */
    public function showauthor(Request $request, PaginatorInterface $paginator, ManagerRegistry $doctrine, $id): Response /* Mise en place de la page des différents ouvrages de l'auteur en question */ 
    {
        
        $author=$doctrine->getRepository(Author::class)->find($id);
        
		$books=$doctrine->getRepository(Book::class)->findByAuthors(array('author' => $author), /*  on se sert du " QueryBuilder "  défini dans " BookRepository " pour récupérer dans la BDD (liaison Many to Many) la liste des livres de chaque auteur*/
            array(),
            100,
            0); 
        $books = $paginator->paginate(
        $books, // Requête contenant les données à paginer (ici nos articles)
        $request->query->getInt('page', 1), // Numéro de la page en cours, passé dans l'URL, 1 si aucune page
        9 // Nombre de résultats par page
                                    );              


        return $this->render('author/index.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
            'controller_name' => 'AuthorController',
            'author'=>$author,
			'books'=>$books,
        ]);
    }
}
