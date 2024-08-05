################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/src/aes.c \
../Encyrption/src/aesce.c \
../Encyrption/src/aesni.c \
../Encyrption/src/aria.c \
../Encyrption/src/asn1parse.c \
../Encyrption/src/asn1write.c \
../Encyrption/src/base64.c \
../Encyrption/src/bignum.c \
../Encyrption/src/bignum_core.c \
../Encyrption/src/bignum_mod.c \
../Encyrption/src/bignum_mod_raw.c \
../Encyrption/src/block_cipher.c \
../Encyrption/src/camellia.c \
../Encyrption/src/ccm.c \
../Encyrption/src/chacha20.c \
../Encyrption/src/chachapoly.c \
../Encyrption/src/cipher.c \
../Encyrption/src/cipher_wrap.c \
../Encyrption/src/cmac.c \
../Encyrption/src/constant_time.c \
../Encyrption/src/ctr_drbg.c \
../Encyrption/src/des.c \
../Encyrption/src/dhm.c \
../Encyrption/src/ecdh.c \
../Encyrption/src/ecdsa.c \
../Encyrption/src/ecjpake.c \
../Encyrption/src/ecp.c \
../Encyrption/src/ecp_curves.c \
../Encyrption/src/ecp_curves_new.c \
../Encyrption/src/entropy.c \
../Encyrption/src/entropy_poll.c \
../Encyrption/src/gcm.c \
../Encyrption/src/hkdf.c \
../Encyrption/src/hmac_drbg.c \
../Encyrption/src/lmots.c \
../Encyrption/src/lms.c \
../Encyrption/src/md.c \
../Encyrption/src/md5.c \
../Encyrption/src/memory_buffer_alloc.c \
../Encyrption/src/nist_kw.c \
../Encyrption/src/oid.c \
../Encyrption/src/pem.c \
../Encyrption/src/pk.c \
../Encyrption/src/pk_ecc.c \
../Encyrption/src/pk_wrap.c \
../Encyrption/src/pkcs12.c \
../Encyrption/src/pkcs5.c \
../Encyrption/src/pkparse.c \
../Encyrption/src/pkwrite.c \
../Encyrption/src/platform.c \
../Encyrption/src/platform_util.c \
../Encyrption/src/poly1305.c \
../Encyrption/src/ripemd160.c \
../Encyrption/src/rsa.c \
../Encyrption/src/rsa_alt_helpers.c \
../Encyrption/src/sha1.c \
../Encyrption/src/sha256.c \
../Encyrption/src/sha3.c \
../Encyrption/src/sha512.c \
../Encyrption/src/threading.c \
../Encyrption/src/timing.c \
../Encyrption/src/version.c 

C_DEPS += \
./Encyrption/src/aes.d \
./Encyrption/src/aesce.d \
./Encyrption/src/aesni.d \
./Encyrption/src/aria.d \
./Encyrption/src/asn1parse.d \
./Encyrption/src/asn1write.d \
./Encyrption/src/base64.d \
./Encyrption/src/bignum.d \
./Encyrption/src/bignum_core.d \
./Encyrption/src/bignum_mod.d \
./Encyrption/src/bignum_mod_raw.d \
./Encyrption/src/block_cipher.d \
./Encyrption/src/camellia.d \
./Encyrption/src/ccm.d \
./Encyrption/src/chacha20.d \
./Encyrption/src/chachapoly.d \
./Encyrption/src/cipher.d \
./Encyrption/src/cipher_wrap.d \
./Encyrption/src/cmac.d \
./Encyrption/src/constant_time.d \
./Encyrption/src/ctr_drbg.d \
./Encyrption/src/des.d \
./Encyrption/src/dhm.d \
./Encyrption/src/ecdh.d \
./Encyrption/src/ecdsa.d \
./Encyrption/src/ecjpake.d \
./Encyrption/src/ecp.d \
./Encyrption/src/ecp_curves.d \
./Encyrption/src/ecp_curves_new.d \
./Encyrption/src/entropy.d \
./Encyrption/src/entropy_poll.d \
./Encyrption/src/gcm.d \
./Encyrption/src/hkdf.d \
./Encyrption/src/hmac_drbg.d \
./Encyrption/src/lmots.d \
./Encyrption/src/lms.d \
./Encyrption/src/md.d \
./Encyrption/src/md5.d \
./Encyrption/src/memory_buffer_alloc.d \
./Encyrption/src/nist_kw.d \
./Encyrption/src/oid.d \
./Encyrption/src/pem.d \
./Encyrption/src/pk.d \
./Encyrption/src/pk_ecc.d \
./Encyrption/src/pk_wrap.d \
./Encyrption/src/pkcs12.d \
./Encyrption/src/pkcs5.d \
./Encyrption/src/pkparse.d \
./Encyrption/src/pkwrite.d \
./Encyrption/src/platform.d \
./Encyrption/src/platform_util.d \
./Encyrption/src/poly1305.d \
./Encyrption/src/ripemd160.d \
./Encyrption/src/rsa.d \
./Encyrption/src/rsa_alt_helpers.d \
./Encyrption/src/sha1.d \
./Encyrption/src/sha256.d \
./Encyrption/src/sha3.d \
./Encyrption/src/sha512.d \
./Encyrption/src/threading.d \
./Encyrption/src/timing.d \
./Encyrption/src/version.d 

OBJS += \
./Encyrption/src/aes.o \
./Encyrption/src/aesce.o \
./Encyrption/src/aesni.o \
./Encyrption/src/aria.o \
./Encyrption/src/asn1parse.o \
./Encyrption/src/asn1write.o \
./Encyrption/src/base64.o \
./Encyrption/src/bignum.o \
./Encyrption/src/bignum_core.o \
./Encyrption/src/bignum_mod.o \
./Encyrption/src/bignum_mod_raw.o \
./Encyrption/src/block_cipher.o \
./Encyrption/src/camellia.o \
./Encyrption/src/ccm.o \
./Encyrption/src/chacha20.o \
./Encyrption/src/chachapoly.o \
./Encyrption/src/cipher.o \
./Encyrption/src/cipher_wrap.o \
./Encyrption/src/cmac.o \
./Encyrption/src/constant_time.o \
./Encyrption/src/ctr_drbg.o \
./Encyrption/src/des.o \
./Encyrption/src/dhm.o \
./Encyrption/src/ecdh.o \
./Encyrption/src/ecdsa.o \
./Encyrption/src/ecjpake.o \
./Encyrption/src/ecp.o \
./Encyrption/src/ecp_curves.o \
./Encyrption/src/ecp_curves_new.o \
./Encyrption/src/entropy.o \
./Encyrption/src/entropy_poll.o \
./Encyrption/src/gcm.o \
./Encyrption/src/hkdf.o \
./Encyrption/src/hmac_drbg.o \
./Encyrption/src/lmots.o \
./Encyrption/src/lms.o \
./Encyrption/src/md.o \
./Encyrption/src/md5.o \
./Encyrption/src/memory_buffer_alloc.o \
./Encyrption/src/nist_kw.o \
./Encyrption/src/oid.o \
./Encyrption/src/pem.o \
./Encyrption/src/pk.o \
./Encyrption/src/pk_ecc.o \
./Encyrption/src/pk_wrap.o \
./Encyrption/src/pkcs12.o \
./Encyrption/src/pkcs5.o \
./Encyrption/src/pkparse.o \
./Encyrption/src/pkwrite.o \
./Encyrption/src/platform.o \
./Encyrption/src/platform_util.o \
./Encyrption/src/poly1305.o \
./Encyrption/src/ripemd160.o \
./Encyrption/src/rsa.o \
./Encyrption/src/rsa_alt_helpers.o \
./Encyrption/src/sha1.o \
./Encyrption/src/sha256.o \
./Encyrption/src/sha3.o \
./Encyrption/src/sha512.o \
./Encyrption/src/threading.o \
./Encyrption/src/timing.o \
./Encyrption/src/version.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/src/%.o Encyrption/src/%.su Encyrption/src/%.cyclo: ../Encyrption/src/%.c Encyrption/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/include" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-src

clean-Encyrption-2f-src:
	-$(RM) ./Encyrption/src/aes.cyclo ./Encyrption/src/aes.d ./Encyrption/src/aes.o ./Encyrption/src/aes.su ./Encyrption/src/aesce.cyclo ./Encyrption/src/aesce.d ./Encyrption/src/aesce.o ./Encyrption/src/aesce.su ./Encyrption/src/aesni.cyclo ./Encyrption/src/aesni.d ./Encyrption/src/aesni.o ./Encyrption/src/aesni.su ./Encyrption/src/aria.cyclo ./Encyrption/src/aria.d ./Encyrption/src/aria.o ./Encyrption/src/aria.su ./Encyrption/src/asn1parse.cyclo ./Encyrption/src/asn1parse.d ./Encyrption/src/asn1parse.o ./Encyrption/src/asn1parse.su ./Encyrption/src/asn1write.cyclo ./Encyrption/src/asn1write.d ./Encyrption/src/asn1write.o ./Encyrption/src/asn1write.su ./Encyrption/src/base64.cyclo ./Encyrption/src/base64.d ./Encyrption/src/base64.o ./Encyrption/src/base64.su ./Encyrption/src/bignum.cyclo ./Encyrption/src/bignum.d ./Encyrption/src/bignum.o ./Encyrption/src/bignum.su ./Encyrption/src/bignum_core.cyclo ./Encyrption/src/bignum_core.d ./Encyrption/src/bignum_core.o ./Encyrption/src/bignum_core.su ./Encyrption/src/bignum_mod.cyclo ./Encyrption/src/bignum_mod.d ./Encyrption/src/bignum_mod.o ./Encyrption/src/bignum_mod.su ./Encyrption/src/bignum_mod_raw.cyclo ./Encyrption/src/bignum_mod_raw.d ./Encyrption/src/bignum_mod_raw.o ./Encyrption/src/bignum_mod_raw.su ./Encyrption/src/block_cipher.cyclo ./Encyrption/src/block_cipher.d ./Encyrption/src/block_cipher.o ./Encyrption/src/block_cipher.su ./Encyrption/src/camellia.cyclo ./Encyrption/src/camellia.d ./Encyrption/src/camellia.o ./Encyrption/src/camellia.su ./Encyrption/src/ccm.cyclo ./Encyrption/src/ccm.d ./Encyrption/src/ccm.o ./Encyrption/src/ccm.su ./Encyrption/src/chacha20.cyclo ./Encyrption/src/chacha20.d ./Encyrption/src/chacha20.o ./Encyrption/src/chacha20.su ./Encyrption/src/chachapoly.cyclo ./Encyrption/src/chachapoly.d ./Encyrption/src/chachapoly.o ./Encyrption/src/chachapoly.su ./Encyrption/src/cipher.cyclo ./Encyrption/src/cipher.d ./Encyrption/src/cipher.o ./Encyrption/src/cipher.su ./Encyrption/src/cipher_wrap.cyclo ./Encyrption/src/cipher_wrap.d ./Encyrption/src/cipher_wrap.o ./Encyrption/src/cipher_wrap.su ./Encyrption/src/cmac.cyclo ./Encyrption/src/cmac.d ./Encyrption/src/cmac.o ./Encyrption/src/cmac.su ./Encyrption/src/constant_time.cyclo ./Encyrption/src/constant_time.d ./Encyrption/src/constant_time.o ./Encyrption/src/constant_time.su ./Encyrption/src/ctr_drbg.cyclo ./Encyrption/src/ctr_drbg.d ./Encyrption/src/ctr_drbg.o ./Encyrption/src/ctr_drbg.su ./Encyrption/src/des.cyclo ./Encyrption/src/des.d ./Encyrption/src/des.o ./Encyrption/src/des.su ./Encyrption/src/dhm.cyclo ./Encyrption/src/dhm.d ./Encyrption/src/dhm.o ./Encyrption/src/dhm.su ./Encyrption/src/ecdh.cyclo ./Encyrption/src/ecdh.d ./Encyrption/src/ecdh.o ./Encyrption/src/ecdh.su ./Encyrption/src/ecdsa.cyclo ./Encyrption/src/ecdsa.d ./Encyrption/src/ecdsa.o ./Encyrption/src/ecdsa.su ./Encyrption/src/ecjpake.cyclo ./Encyrption/src/ecjpake.d ./Encyrption/src/ecjpake.o ./Encyrption/src/ecjpake.su ./Encyrption/src/ecp.cyclo ./Encyrption/src/ecp.d ./Encyrption/src/ecp.o ./Encyrption/src/ecp.su ./Encyrption/src/ecp_curves.cyclo ./Encyrption/src/ecp_curves.d ./Encyrption/src/ecp_curves.o ./Encyrption/src/ecp_curves.su ./Encyrption/src/ecp_curves_new.cyclo ./Encyrption/src/ecp_curves_new.d ./Encyrption/src/ecp_curves_new.o ./Encyrption/src/ecp_curves_new.su ./Encyrption/src/entropy.cyclo ./Encyrption/src/entropy.d ./Encyrption/src/entropy.o ./Encyrption/src/entropy.su ./Encyrption/src/entropy_poll.cyclo ./Encyrption/src/entropy_poll.d ./Encyrption/src/entropy_poll.o ./Encyrption/src/entropy_poll.su ./Encyrption/src/gcm.cyclo ./Encyrption/src/gcm.d ./Encyrption/src/gcm.o ./Encyrption/src/gcm.su ./Encyrption/src/hkdf.cyclo ./Encyrption/src/hkdf.d ./Encyrption/src/hkdf.o ./Encyrption/src/hkdf.su ./Encyrption/src/hmac_drbg.cyclo ./Encyrption/src/hmac_drbg.d ./Encyrption/src/hmac_drbg.o ./Encyrption/src/hmac_drbg.su ./Encyrption/src/lmots.cyclo ./Encyrption/src/lmots.d ./Encyrption/src/lmots.o ./Encyrption/src/lmots.su ./Encyrption/src/lms.cyclo ./Encyrption/src/lms.d ./Encyrption/src/lms.o ./Encyrption/src/lms.su ./Encyrption/src/md.cyclo ./Encyrption/src/md.d ./Encyrption/src/md.o ./Encyrption/src/md.su ./Encyrption/src/md5.cyclo ./Encyrption/src/md5.d ./Encyrption/src/md5.o ./Encyrption/src/md5.su ./Encyrption/src/memory_buffer_alloc.cyclo ./Encyrption/src/memory_buffer_alloc.d ./Encyrption/src/memory_buffer_alloc.o ./Encyrption/src/memory_buffer_alloc.su ./Encyrption/src/nist_kw.cyclo ./Encyrption/src/nist_kw.d ./Encyrption/src/nist_kw.o ./Encyrption/src/nist_kw.su ./Encyrption/src/oid.cyclo ./Encyrption/src/oid.d ./Encyrption/src/oid.o ./Encyrption/src/oid.su ./Encyrption/src/pem.cyclo ./Encyrption/src/pem.d ./Encyrption/src/pem.o ./Encyrption/src/pem.su ./Encyrption/src/pk.cyclo ./Encyrption/src/pk.d ./Encyrption/src/pk.o ./Encyrption/src/pk.su ./Encyrption/src/pk_ecc.cyclo ./Encyrption/src/pk_ecc.d ./Encyrption/src/pk_ecc.o ./Encyrption/src/pk_ecc.su ./Encyrption/src/pk_wrap.cyclo ./Encyrption/src/pk_wrap.d ./Encyrption/src/pk_wrap.o ./Encyrption/src/pk_wrap.su ./Encyrption/src/pkcs12.cyclo ./Encyrption/src/pkcs12.d ./Encyrption/src/pkcs12.o ./Encyrption/src/pkcs12.su ./Encyrption/src/pkcs5.cyclo ./Encyrption/src/pkcs5.d ./Encyrption/src/pkcs5.o ./Encyrption/src/pkcs5.su ./Encyrption/src/pkparse.cyclo ./Encyrption/src/pkparse.d ./Encyrption/src/pkparse.o ./Encyrption/src/pkparse.su ./Encyrption/src/pkwrite.cyclo ./Encyrption/src/pkwrite.d ./Encyrption/src/pkwrite.o ./Encyrption/src/pkwrite.su ./Encyrption/src/platform.cyclo ./Encyrption/src/platform.d ./Encyrption/src/platform.o ./Encyrption/src/platform.su ./Encyrption/src/platform_util.cyclo ./Encyrption/src/platform_util.d ./Encyrption/src/platform_util.o ./Encyrption/src/platform_util.su ./Encyrption/src/poly1305.cyclo ./Encyrption/src/poly1305.d ./Encyrption/src/poly1305.o ./Encyrption/src/poly1305.su ./Encyrption/src/ripemd160.cyclo ./Encyrption/src/ripemd160.d ./Encyrption/src/ripemd160.o ./Encyrption/src/ripemd160.su
	-$(RM) ./Encyrption/src/rsa.cyclo ./Encyrption/src/rsa.d ./Encyrption/src/rsa.o ./Encyrption/src/rsa.su ./Encyrption/src/rsa_alt_helpers.cyclo ./Encyrption/src/rsa_alt_helpers.d ./Encyrption/src/rsa_alt_helpers.o ./Encyrption/src/rsa_alt_helpers.su ./Encyrption/src/sha1.cyclo ./Encyrption/src/sha1.d ./Encyrption/src/sha1.o ./Encyrption/src/sha1.su ./Encyrption/src/sha256.cyclo ./Encyrption/src/sha256.d ./Encyrption/src/sha256.o ./Encyrption/src/sha256.su ./Encyrption/src/sha3.cyclo ./Encyrption/src/sha3.d ./Encyrption/src/sha3.o ./Encyrption/src/sha3.su ./Encyrption/src/sha512.cyclo ./Encyrption/src/sha512.d ./Encyrption/src/sha512.o ./Encyrption/src/sha512.su ./Encyrption/src/threading.cyclo ./Encyrption/src/threading.d ./Encyrption/src/threading.o ./Encyrption/src/threading.su ./Encyrption/src/timing.cyclo ./Encyrption/src/timing.d ./Encyrption/src/timing.o ./Encyrption/src/timing.su ./Encyrption/src/version.cyclo ./Encyrption/src/version.d ./Encyrption/src/version.o ./Encyrption/src/version.su

.PHONY: clean-Encyrption-2f-src

