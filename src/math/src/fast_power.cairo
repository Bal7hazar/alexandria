//! # Fast power algorithm

// Calculate the ( base ^ power ) mod modulus
// using the fast powering algorithm # Arguments
// * ` base ` - The base of the exponentiation 
// * ` power ` - The power of the exponentiation 
// * ` modulus ` - The modulus used in the calculation # Returns
// * ` u128 ` - The result of ( base ^ power ) mod modulus

pub fn fast_power(base: u128, mut power: u128, modulus: u128) -> u128 {
    assert!(base != 0, "fast_power: invalid input");

    if modulus == 1 {
        return 0;
    }

    let mut base: u256 = base.into();
    let modulus: u256 = modulus.into();
    let mut result: u256 = 1;

    while (power != 0) {
        if power % 2 != 0 {
            result = (result * base) % modulus;
        }

        base = (base * base) % modulus;
        power = power / 2;
    };

    result.try_into().expect('value cant be larger than u128')
}
