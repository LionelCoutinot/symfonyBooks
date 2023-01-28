<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Knp\Component\Pager\PaginatorInterface; 

class CategoryController extends AbstractController
{
    #[Route('/category', name: 'category')]
    /**
     * @Route("/category/", name="app_category")
     */
    public function indexcategories(Request $request, ManagerRegistry $doctrine): Response /* Fonction destinée à afficher un index des " catégories " */
    {        
        $categories=$doctrine->getRepository(Category::class)->findBy(array(),
            array('id' => 'asc'),
            1000,
            0);
        return $this->render('category/indexcategories.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
            'controller_name' => 'CategoryController',
            'categories'=>$categories,
        ]);
    }

    /**
     * @Route("/category/{id}", name="category")
     */
    public function show(Request $request, PaginatorInterface $paginator, ManagerRegistry $doctrine, $id): Response /* Récupération dans la BDD des livres par " catégorie " */
    {
		$category=$doctrine->getRepository(Category::class)->find($id);
		$books=$doctrine->getRepository(Book::class)->findBy(array('category' => $category),
            array(),
            100,
            0);   
                                          
        $books = $paginator->paginate(
            $books, // Requête contenant les données à paginer (ici nos articles)
            $request->query->getInt('page', 1), // Numéro de la page en cours, passé dans l'URL, 1 si aucune page
            9 // Nombre de résultats par page
        );                             
        return $this->render('category/index.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
            'controller_name' => 'CategoryController',
			'category'=>$category,
			'books'=>$books,  
        ]);
    }
}


