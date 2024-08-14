#include "Crypto.h"

int8_t public_key[PUBLIC_KEY_SIZE];
static int8_t private_key[PUBLIC_KEY_SIZE];

int8_t Device_PublicKey[PUBLIC_KEY_SIZE];

void generateKeys()
{
    
    printf("generating Keys\n");
    for(int i=0; i<PUBLIC_KEY_SIZE; ++i)
    {
        srand(time(NULL));
        public_key[i] = rand() % 129;
        private_key[i] = -public_key[i];
    }
    printf("generating Keys\n");
}

void encrypt(char *org_string, PUB_KEY key)
{
    int8_t *pub_key = key == DEVICE_KEY ? Device_PublicKey : public_key;
    for(int i=0; i<PUBLIC_KEY_SIZE; ++i)
    {
        org_string[i] = org_string[i] + pub_key[i];
    }
}


void decrypt(char *org_string)
{
    for(int i=0; i<PUBLIC_KEY_SIZE; ++i)
    {
        org_string[i] = org_string[i] + private_key[i];
    }
}