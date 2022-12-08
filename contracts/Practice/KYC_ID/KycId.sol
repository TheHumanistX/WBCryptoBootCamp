//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

// There are times where it is not necessary to share your entire identity (especially home address) when verifying your identity
// with a business or institution.  It would be nice to be able to share only what is needed to avoid oversharing of information.
// This idea springs from reports in the past of women giving their identification at bars or different events and someone 
// copies down their name and address and then stalks them. Sad but very real risk.

// The reason blockchain would be a good use of this is the immutability and verification abilities so that a person could, for
// instance, share only their photo and date of birth and it is verified as accurate and real by the blockchain (through some
// official institution (government), whereas with hardcopy identification, it could be faked.  Businesses could know that 
// the information they are seeing is valid, accurate, and official without worry of fraudulant identification.

// We will begin only utilizing the structure of identification via drivers license in the United States

//  Items typically on ID and requested by various institutions/businesses
    // License Number, Issue Date, Expiry Date, First Name, Last Name, Date of Birth, Photo, Address (broken down to address 
    // number, street, city, state, zip code), License Class (M, C, B, A), Organ Donor (Y, N), Restrictions, Sex, Eyes, Hair, 
    // Height, Race, Signature(necessary?), DD (the only number on the license guarunteed to be unique, this number is unique 
    // per actual license issued... may not be needed in same manner but will see as we move forward)

// The visual aspect of the license would, of course, be an NFT. This would make it one-of-a-kind and immutable. 

contract kycId {

    

}