<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MentionsController extends AbstractController 
{
    /**
     * @Route("/mentions", name="mentions")
     */
    public function mentionslegale(): Response /* fonction donnant accès à la page " Mentions Légales "  */
    {
        return $this->render('mentions/index.html.twig', [
            'controller_name' => 'MentionsController',
        ]);
    }
}
