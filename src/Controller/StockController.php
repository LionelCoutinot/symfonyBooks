<?php

namespace App\Controller;
use App\Entity\Book;
use App\Entity\Author;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Persistence\ManagerRegistry;

class StockController extends AbstractController
{
    #[Route('/stock', name: 'app_stock')]
    public function indexstocks(Request $request, ManagerRegistry $doctrine): Response /* Index des stocks pour chaque livre à l'intention de l'administrateur */
    {        
    $books=$doctrine->getRepository(Book::class)->findBy(array(), /* Récupération de chaque livre et de son stock le tout ordonné par " id " ascendant  */
        array('id' => 'asc'),
        1000,
        0);
       

    return $this->render('stock/index.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
        'controller_name' => 'StockController',
        'books' =>$books,        
        ]);
    }
}
