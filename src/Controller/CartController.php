<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Author;
use App\Repository\BookRepository;
use App\Entity\Purchase;
use App\Form\PurchaseType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface; /*Session PHP. Permet de  stocker le panier pour le passer  à la page Twig au fur et à mesure de son évolution */


class CartController extends AbstractController
{
    #[Route('/cart', name: 'cart_index')]
    public function index(SessionInterface $session, BookRepository $bookRepository,ManagerRegistry $doctrine, Request $request)
    {
        $panier = $session->get("panier", []);        
        // On "fabrique" les données
        $dataPanier = [];
        $total = 0;
        $total2 = 0;
        $totalquantite=0;   

        foreach($panier as $id => $quantite){
            $book = $bookRepository->find($id);
            $stock = $book->getStock(); // on récupère le stock          
            $authors=$doctrine->getRepository(Author::class)->find($id);
            $books=$doctrine->getRepository(Book::class)->findByAuthors(array('authors' => $authors), /* On récupère les auteurs */
                array(),
                100,
                0);  
            $dataPanier[] = [
                "book" => $book,
                "quantite" => $quantite
            ];
            $total2 = $book->getPrice() - $book->getPromo();
            
            if (empty($book->getPromo()))
            {
                $total += ($book->getPrice()) * $quantite; 
                $stock= $book->setStock($stock-$quantite); // calcul du stock en soustrayant la quantité des prix normaux
                $totalquantite += $quantite;
            }
            else
            {
                $total += ($book->getPrice()-$total2) * $quantite;
                $stock= $book->setStock($stock-$quantite); // calcul du stock en soustrayant la quantité des promos 
                $totalquantite += $quantite;
            }           
        }
        /* On récupère le dernier nunéro de commande */
        $lastNumber=$doctrine->getRepository(Purchase::class)->findBy(array(), array('id' => 'desc'),1,0);
        $number =  $lastNumber[0] -> getNumberorder();
        $number = $number + 1; 
        // Création du formulaire pour la commande
        $purchase = new Purchase();        
        $form = $this->createForm(PurchaseType::class, $purchase); 
        $form->handleRequest($request);        
        if ($form->isSubmitted() && $form->isValid()) {            
            // On stocke    
            $em = $doctrine->getManager(); // On récupère l'entity manager                     
            $em->persist($purchase); // On confie notre entité à l'entity manager (on persist l'entité)
            $em->flush(); // On execute la requete            
            $this->addFlash( /*Notice de réussite */
                'notice',
                'Commande validée !'
            );
            return $this->redirectToRoute('app_purchase',['id' =>  $purchase->getId()]);
        }
        return $this->render('cart/index.html.twig',   [  /* Envoi des données au fichier  template  Twig concerné */
            'form' => $form->createView(),
            'dataPanier' =>  $dataPanier,
            'total'=> $total,
            'total2' => $total2,
            'purchase' => $purchase,  
            'number'  => $number, 
            'totalquantite' => $totalquantite,
            ])
          ;
    }

    /**
     * @Route("/add/{id}", name="cart_add")
     */
    public function add(Book $book, SessionInterface $session) /* Ajout au panier */
    {
        // On récupère le panier actuel
        $panier = $session->get("panier", []);
        $id = $book->getId();

        if(!empty($panier[$id])){
            $panier[$id]++;
        }else{
            $panier[$id] = 1;
        }

        // On sauvegarde dans la session
        $session->set("panier", $panier);

        return $this->redirectToRoute("cart_index"); /* Redirection une fois la fonction exécutée */
    }

    /**
     * @Route("/remove/{id}", name="cart_remove")
     */
    public function remove(Book $book, SessionInterface $session) /* Comptage quand on supprime  des articles du panier*/ 
    {
        // On récupère le panier actuel
        $panier = $session->get("panier", []);
        $id = $book->getId();

        if(!empty($panier[$id])){
            if($panier[$id] > 1){
                $panier[$id]--;
            }else{
                unset($panier[$id]);
            }
        }

        // On sauvegarde dans la session
        $session->set("panier", $panier);
        return $this->redirectToRoute("cart_index");/* Redirection une fois la fonction exécutée */
    }

    /**
     * @Route("/delete/{id}", name="cart_delete")
     */
    public function delete(Book $book, SessionInterface $session)  /* Suppression d'un article du panier */
    {
        // On récupère le panier actuel
        $panier = $session->get("panier", []);
        $id = $book->getId();

        if(!empty($panier[$id])){
            unset($panier[$id]);
        }

        // On sauvegarde dans la session
        $session->set("panier", $panier);

        return $this->redirectToRoute("cart_index");
    }

    /**
     * @Route("/delete", name="cart_delete_all") 
     */
    public function deleteAll(SessionInterface $session)/* Suppression de tous les éléments du panier */
    {
        $session->remove("panier");
        return $this->redirectToRoute("cart_index");
    }
}




