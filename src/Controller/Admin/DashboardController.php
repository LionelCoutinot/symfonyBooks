<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Entity\Book;
use App\Entity\Category;
use App\Entity\Purchase;
use App\Entity\Author;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        //return parent::index();
        return $this->render('admin/index.html.twig'); // Chemin vers la page personnalisée pour la page d'accueil de " l'admin "

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        // $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        // return $this->redirect($adminUrlGenerator->setController(OneOfYourCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('SymfonyBooks');
    }

    public function configureMenuItems(): iterable // Appel des différents menus disponibles de la page  de  " l'admin "
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        // yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
        yield MenuItem::linkToCrud('Utilisateur', 'fas fa-list', User::class);
        yield MenuItem::linkToCrud('Auteur', 'fas fa-list', Author::class);
        yield MenuItem::linkToCrud('Livre', 'fas fa-list', Book::class);
        yield MenuItem::linkToCrud('Categorie', 'fas fa-list', Category::class);  
      /* yield MenuItem::linkToCrud('Commande', 'fas fa-list', Purchase::class);  */
    }
}
