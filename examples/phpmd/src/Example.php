<?php

class Example {
    
    public function __construct(
        private readonly string $thiIsAnAmazingVariable
    ) {
        $anotherVariable = 'unused';
    }

    public function snake_case_method(): void {
        echo "🐍";
    }

    public function uselessCatchBlock(): void {
        try {
            throw new \Exception('Catch block does nothing');
        } catch (\Exception $e) {
            
        }
    }

    public function undefinedVariable(): void {
        if ($number > 10) {
            echo "Number is greater than 10";
        }
    }
}
