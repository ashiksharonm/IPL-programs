<?php
    $cipher = "licet";
    $key = intval("3");

    $cipherText = "";
    $length = strlen($cipher);

    // loop through all the characters in the cipher text
    for ($i = 0; $i < $length; $i++) {
        $char = $cipher[$i];
        
        if (ctype_alpha($char)) {
            $ascii = ord(ctype_upper($char) ? 'A' : 'a');
            // Shift the characters by the given key
            $shiftedChar = chr(($ascii + (($key + ord($char) - $ascii) % 26)));
            $cipherText .= $shiftedChar;
        } else {
            $cipherText .= $char;
        }
    } 

    // Output the ciphertext
    echo "Ciphertext: " . $cipherText . "\n";
?>
