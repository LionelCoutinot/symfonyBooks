<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PurchaseType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void /* Définition des divers types de champs pour le formulaire de commande et des paramètres qui leur sont assignés si besoin */
    {
        $builder
            ->add('firstname',  TextType::class)
            ->add('lastname',  TextType::class)
            ->add('age',  IntegerType::class, ['required' => false])
            ->add('flat',  TextType::class, ['required' => false])
            ->add('street',  TextType::class)
            ->add('town',  TextType::class)
            ->add('postalcode',  IntegerType::class)               
            ->add('email',  EmailType::class)
            ->add('telephone',  TextType::class, ['required' => false])
            ->add('purchaseorder',  TextareaType::class,  array('required' => false, 'attr'=> array('style'=>'display:none')) )
            ->add('numberorder', HiddenType::class)
            ->add('totalquantite',  HiddenType::class)
            ->add('totalprice',  NumberType::class, array('attr'=> array('style'=>'display:none'))) // une autre façon de faire un champ " hidden "            
            ->add('payment', ChoiceType::class,[
                'choices' => [
                    'Carte' => 'Carte',
                    'Chèque' => 'Chèque',
                    'Virement' => 'Virement',
                    'Mandat' => 'Mandat',
                ], ]/* ['class' => payment::class]*/)
            ->add('rgpd',  CheckboxType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}

