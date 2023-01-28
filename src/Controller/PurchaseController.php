<?php

namespace App\Controller;

use App\Entity\Purchase;
use App\Repository\BookRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface; /*Session PHP. Permet de  stocker le panier pour le passer  à la page Twig au fur et à mesure de son évolution */


class PurchaseController extends AbstractController
{
    #[Route('/purchase/{id}', name: 'app_purchase')]
    public function index(SessionInterface $session, BookRepository $bookRepository, ManagerRegistry $doctrine, $id): Response /* Récupération des éléments du panier pour les intégrer dans une commande dont les données viennent d'être enregistrées en BDD */
    {
        $purchase=$doctrine->getRepository(Purchase::class)->find($id);         
        $session->remove("panier");

        {
            return $this->render('purchase/index.html.twig', [  /* Envoi des données au fichier template Twig concerné */
                'controller_name' => 'PurchaseController',
                'purchase' => $purchase,
            ]);
        }
    }
}

