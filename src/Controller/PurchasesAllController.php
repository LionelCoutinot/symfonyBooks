<?php

namespace App\Controller;

use App\Entity\Purchase;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Knp\Component\Pager\PaginatorInterface; 

class PurchasesAllController extends AbstractController
{
    #[Route('/purchases', name: 'allpurchases')]
    public function index(Request $request, PaginatorInterface $paginator,ManagerRegistry $doctrine): Response /* Index des commandes */
    {
        $purchases=$doctrine->getRepository(Purchase::class)->findAll();
        $purchases = $paginator->paginate(
        $purchases, // Requête contenant les données à paginer (ici nos articles)
         $request->query->getInt('page', 1), // Numéro de la page en cours, passé dans l'URL, 1 si aucune page
        12 // Nombre de résultats par page
                                        );  

        return $this->render('PurchasesAll/index.html.twig', [  /* Envoi des données au fichier  template  Twig concerné */
            'controller_name' => 'AllPurchasesController',
            'purchases' => $purchases,
        ]);
    }
}

