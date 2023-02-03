<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\NotNull;

class CommentsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void /* Définition des divers types de champs pour le formulaire des commentaires et des paramètres qui leur sont assignés si besoin */
    {
        $builder
        ->add('email', EmailType::class, [
            'label' => 'Votre e-mail',
            'attr' => [
                'class' => 'form-control'
            ]
        ])
        ->add('nickname', TextType::class, [
            'label' => 'Votre pseudo',
            'attr' => [
                'class' => 'form-control'
            ]
        ])
        ->add('content', TextareaType::class, [
            'required' => false, 
            'label' => 'Votre commentaire',
            'attr' => [
                'class' => 'form-control',
                'rows' => 10,
            ]
        ])

        ->add('note', NumberType::class, [
            'required' => false,
            'attr' => [
                'style'=>'display:none'
            ]
        ])

        ->add('rgpd', CheckboxType::class, [
            'label' => 'J\'accepte que mes données soient enregistrées !',
            'constraints' => [new NotBlank()]
        ])
        
        /*->add('envoyer', SubmitType::class)*/
    ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
