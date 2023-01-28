<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230122224428 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE purchase (id INT AUTO_INCREMENT NOT NULL, firstname VARCHAR(200) NOT NULL, lastname VARCHAR(200) NOT NULL, age SMALLINT DEFAULT NULL, flat VARCHAR(255) DEFAULT NULL, street VARCHAR(255) NOT NULL, town VARCHAR(255) NOT NULL, postalcode INT NOT NULL, email VARCHAR(255) NOT NULL, telephone VARCHAR(150) NOT NULL, purchaseorder LONGTEXT NOT NULL, numberorder INT NOT NULL, totalquantite INT NOT NULL, totalprice NUMERIC(10, 2) NOT NULL, payment VARCHAR(200) NOT NULL, rgpd SMALLINT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE purchase');
    }
}
