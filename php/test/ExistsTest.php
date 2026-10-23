<?php
declare(strict_types=1);

// N2026TaxFigures SDK exists test

require_once __DIR__ . '/../n2026taxfigures_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = N2026TaxFiguresSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
