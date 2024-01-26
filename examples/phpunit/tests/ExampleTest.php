<?php

declare(strict_types=1);

namespace Test;

use App\Example;
use PHPUnit\Framework\TestCase;

final class ExampleTest extends TestCase
{
    /**
     * @test
     * @covers \App\Example::whatIsTheBestDevEnvForPhp
     */
    public function whatIsTheBestDevEnvForPhp(): void
    {
        self::assertSame('phpctl', (new Example())->whatIsTheBestDevEnvForPhp());
    }
}
