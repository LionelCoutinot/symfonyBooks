<?php

namespace App\Entity;

use App\Repository\PurchaseRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PurchaseRepository::class)]
class Purchase
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 200)]
    private ?string $firstname = null;

    #[ORM\Column(length: 200)]
    private ?string $lastname = null;

    #[ORM\Column(type: Types::SMALLINT, nullable: true)]
    private ?int $age = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $flat = null;

    #[ORM\Column(length: 255)]
    private ?string $street = null;

    #[ORM\Column(length: 255)]
    private ?string $town = null;

    #[ORM\Column]
    private ?int $postalcode = null;

    #[ORM\Column(length: 255)]
    private ?string $email = null;

    #[ORM\Column(length: 150)]
    private ?string $telephone = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $purchaseorder = null;

    #[ORM\Column]
    private ?int $numberorder = null;

    #[ORM\Column]
    private ?int $totalquantite = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $totalprice = null;

    #[ORM\Column(length: 200)]
    private ?string $payment = null;

    #[ORM\Column(type: Types::SMALLINT)]
    private ?int $rgpd = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getAge(): ?int
    {
        return $this->age;
    }

    public function setAge(?int $age): self
    {
        $this->age = $age;

        return $this;
    }

    public function getFlat(): ?string
    {
        return $this->flat;
    }

    public function setFlat(?string $flat): self
    {
        $this->flat = $flat;

        return $this;
    }

    public function getStreet(): ?string
    {
        return $this->street;
    }

    public function setStreet(string $street): self
    {
        $this->street = $street;

        return $this;
    }

    public function getTown(): ?string
    {
        return $this->town;
    }

    public function setTown(string $town): self
    {
        $this->town = $town;

        return $this;
    }

    public function getPostalcode(): ?int
    {
        return $this->postalcode;
    }

    public function setPostalcode(int $postalcode): self
    {
        $this->postalcode = $postalcode;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getTelephone(): ?string
    {
        return $this->telephone;
    }

    public function setTelephone(string $telephone): self
    {
        $this->telephone = $telephone;

        return $this;
    }

    public function getPurchaseorder(): ?string
    {
        return $this->purchaseorder;
    }

    public function setPurchaseorder(string $purchaseorder): self
    {
        $this->purchaseorder = $purchaseorder;

        return $this;
    }

    public function getNumberorder(): ?int
    {
        return $this->numberorder;
    }

    public function setNumberorder(int $numberorder): self
    {
        $this->numberorder = $numberorder;

        return $this;
    }

    public function getTotalquantite(): ?int
    {
        return $this->totalquantite;
    }

    public function setTotalquantite(int $totalquantite): self
    {
        $this->totalquantite = $totalquantite;

        return $this;
    }

    public function getTotalprice(): ?string
    {
        return $this->totalprice;
    }

    public function setTotalprice(string $totalprice): self
    {
        $this->totalprice = $totalprice;

        return $this;
    }

    public function getPayment(): ?string
    {
        return $this->payment;
    }

    public function setPayment(string $payment): self
    {
        $this->payment = $payment;

        return $this;
    }

    public function getRgpd(): ?int
    {
        return $this->rgpd;
    }

    public function setRgpd(int $rgpd): self
    {
        $this->rgpd = $rgpd;

        return $this;
    }
}
