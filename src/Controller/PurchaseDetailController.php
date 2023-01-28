<?php

namespace App\Controller;

use App\Entity\Purchase;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;

class PurchaseDetailController extends AbstractController
{
    #[Route('/purchasedetail/{id}', name: 'purchasedetail')]
    public function singlePurchase(ManagerRegistry $doctrine, $id): Response /* Détail de chaque commande à l'intention de chaque de l'administrateur */
    {
        $purchase=$doctrine->getRepository(Purchase::class)->find($id);
       
        return $this->render('PurchaseDetail/index.html.twig', [   /* Envoi des données au fichier  template  Twig concerné */
            'controller_name' => 'PurchaseDetailController',
            'purchase'=>$purchase,
        ]);
    }
}
