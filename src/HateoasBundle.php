<?php

declare(strict_types=1);

namespace Zuruuh\HateoasBundle;

use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Bundle\Bundle;

/**
 * @api
 */
final class HateoasBundle extends Bundle
{
    public function build(ContainerBuilder $container): void
    {
        parent::build($container);

        // Register compiler passes
    }
}
