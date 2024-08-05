################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/pkey/dh_client.c \
../Encyrption/mbedtls/programs/pkey/dh_genprime.c \
../Encyrption/mbedtls/programs/pkey/dh_server.c \
../Encyrption/mbedtls/programs/pkey/ecdh_curve25519.c \
../Encyrption/mbedtls/programs/pkey/ecdsa.c \
../Encyrption/mbedtls/programs/pkey/gen_key.c \
../Encyrption/mbedtls/programs/pkey/key_app.c \
../Encyrption/mbedtls/programs/pkey/key_app_writer.c \
../Encyrption/mbedtls/programs/pkey/mpi_demo.c \
../Encyrption/mbedtls/programs/pkey/pk_decrypt.c \
../Encyrption/mbedtls/programs/pkey/pk_encrypt.c \
../Encyrption/mbedtls/programs/pkey/pk_sign.c \
../Encyrption/mbedtls/programs/pkey/pk_verify.c \
../Encyrption/mbedtls/programs/pkey/rsa_decrypt.c \
../Encyrption/mbedtls/programs/pkey/rsa_encrypt.c \
../Encyrption/mbedtls/programs/pkey/rsa_genkey.c \
../Encyrption/mbedtls/programs/pkey/rsa_sign.c \
../Encyrption/mbedtls/programs/pkey/rsa_sign_pss.c \
../Encyrption/mbedtls/programs/pkey/rsa_verify.c \
../Encyrption/mbedtls/programs/pkey/rsa_verify_pss.c 

C_DEPS += \
./Encyrption/mbedtls/programs/pkey/dh_client.d \
./Encyrption/mbedtls/programs/pkey/dh_genprime.d \
./Encyrption/mbedtls/programs/pkey/dh_server.d \
./Encyrption/mbedtls/programs/pkey/ecdh_curve25519.d \
./Encyrption/mbedtls/programs/pkey/ecdsa.d \
./Encyrption/mbedtls/programs/pkey/gen_key.d \
./Encyrption/mbedtls/programs/pkey/key_app.d \
./Encyrption/mbedtls/programs/pkey/key_app_writer.d \
./Encyrption/mbedtls/programs/pkey/mpi_demo.d \
./Encyrption/mbedtls/programs/pkey/pk_decrypt.d \
./Encyrption/mbedtls/programs/pkey/pk_encrypt.d \
./Encyrption/mbedtls/programs/pkey/pk_sign.d \
./Encyrption/mbedtls/programs/pkey/pk_verify.d \
./Encyrption/mbedtls/programs/pkey/rsa_decrypt.d \
./Encyrption/mbedtls/programs/pkey/rsa_encrypt.d \
./Encyrption/mbedtls/programs/pkey/rsa_genkey.d \
./Encyrption/mbedtls/programs/pkey/rsa_sign.d \
./Encyrption/mbedtls/programs/pkey/rsa_sign_pss.d \
./Encyrption/mbedtls/programs/pkey/rsa_verify.d \
./Encyrption/mbedtls/programs/pkey/rsa_verify_pss.d 

OBJS += \
./Encyrption/mbedtls/programs/pkey/dh_client.o \
./Encyrption/mbedtls/programs/pkey/dh_genprime.o \
./Encyrption/mbedtls/programs/pkey/dh_server.o \
./Encyrption/mbedtls/programs/pkey/ecdh_curve25519.o \
./Encyrption/mbedtls/programs/pkey/ecdsa.o \
./Encyrption/mbedtls/programs/pkey/gen_key.o \
./Encyrption/mbedtls/programs/pkey/key_app.o \
./Encyrption/mbedtls/programs/pkey/key_app_writer.o \
./Encyrption/mbedtls/programs/pkey/mpi_demo.o \
./Encyrption/mbedtls/programs/pkey/pk_decrypt.o \
./Encyrption/mbedtls/programs/pkey/pk_encrypt.o \
./Encyrption/mbedtls/programs/pkey/pk_sign.o \
./Encyrption/mbedtls/programs/pkey/pk_verify.o \
./Encyrption/mbedtls/programs/pkey/rsa_decrypt.o \
./Encyrption/mbedtls/programs/pkey/rsa_encrypt.o \
./Encyrption/mbedtls/programs/pkey/rsa_genkey.o \
./Encyrption/mbedtls/programs/pkey/rsa_sign.o \
./Encyrption/mbedtls/programs/pkey/rsa_sign_pss.o \
./Encyrption/mbedtls/programs/pkey/rsa_verify.o \
./Encyrption/mbedtls/programs/pkey/rsa_verify_pss.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/pkey/%.o Encyrption/mbedtls/programs/pkey/%.su Encyrption/mbedtls/programs/pkey/%.cyclo: ../Encyrption/mbedtls/programs/pkey/%.c Encyrption/mbedtls/programs/pkey/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-pkey

clean-Encyrption-2f-mbedtls-2f-programs-2f-pkey:
	-$(RM) ./Encyrption/mbedtls/programs/pkey/dh_client.cyclo ./Encyrption/mbedtls/programs/pkey/dh_client.d ./Encyrption/mbedtls/programs/pkey/dh_client.o ./Encyrption/mbedtls/programs/pkey/dh_client.su ./Encyrption/mbedtls/programs/pkey/dh_genprime.cyclo ./Encyrption/mbedtls/programs/pkey/dh_genprime.d ./Encyrption/mbedtls/programs/pkey/dh_genprime.o ./Encyrption/mbedtls/programs/pkey/dh_genprime.su ./Encyrption/mbedtls/programs/pkey/dh_server.cyclo ./Encyrption/mbedtls/programs/pkey/dh_server.d ./Encyrption/mbedtls/programs/pkey/dh_server.o ./Encyrption/mbedtls/programs/pkey/dh_server.su ./Encyrption/mbedtls/programs/pkey/ecdh_curve25519.cyclo ./Encyrption/mbedtls/programs/pkey/ecdh_curve25519.d ./Encyrption/mbedtls/programs/pkey/ecdh_curve25519.o ./Encyrption/mbedtls/programs/pkey/ecdh_curve25519.su ./Encyrption/mbedtls/programs/pkey/ecdsa.cyclo ./Encyrption/mbedtls/programs/pkey/ecdsa.d ./Encyrption/mbedtls/programs/pkey/ecdsa.o ./Encyrption/mbedtls/programs/pkey/ecdsa.su ./Encyrption/mbedtls/programs/pkey/gen_key.cyclo ./Encyrption/mbedtls/programs/pkey/gen_key.d ./Encyrption/mbedtls/programs/pkey/gen_key.o ./Encyrption/mbedtls/programs/pkey/gen_key.su ./Encyrption/mbedtls/programs/pkey/key_app.cyclo ./Encyrption/mbedtls/programs/pkey/key_app.d ./Encyrption/mbedtls/programs/pkey/key_app.o ./Encyrption/mbedtls/programs/pkey/key_app.su ./Encyrption/mbedtls/programs/pkey/key_app_writer.cyclo ./Encyrption/mbedtls/programs/pkey/key_app_writer.d ./Encyrption/mbedtls/programs/pkey/key_app_writer.o ./Encyrption/mbedtls/programs/pkey/key_app_writer.su ./Encyrption/mbedtls/programs/pkey/mpi_demo.cyclo ./Encyrption/mbedtls/programs/pkey/mpi_demo.d ./Encyrption/mbedtls/programs/pkey/mpi_demo.o ./Encyrption/mbedtls/programs/pkey/mpi_demo.su ./Encyrption/mbedtls/programs/pkey/pk_decrypt.cyclo ./Encyrption/mbedtls/programs/pkey/pk_decrypt.d ./Encyrption/mbedtls/programs/pkey/pk_decrypt.o ./Encyrption/mbedtls/programs/pkey/pk_decrypt.su ./Encyrption/mbedtls/programs/pkey/pk_encrypt.cyclo ./Encyrption/mbedtls/programs/pkey/pk_encrypt.d ./Encyrption/mbedtls/programs/pkey/pk_encrypt.o ./Encyrption/mbedtls/programs/pkey/pk_encrypt.su ./Encyrption/mbedtls/programs/pkey/pk_sign.cyclo ./Encyrption/mbedtls/programs/pkey/pk_sign.d ./Encyrption/mbedtls/programs/pkey/pk_sign.o ./Encyrption/mbedtls/programs/pkey/pk_sign.su ./Encyrption/mbedtls/programs/pkey/pk_verify.cyclo ./Encyrption/mbedtls/programs/pkey/pk_verify.d ./Encyrption/mbedtls/programs/pkey/pk_verify.o ./Encyrption/mbedtls/programs/pkey/pk_verify.su ./Encyrption/mbedtls/programs/pkey/rsa_decrypt.cyclo ./Encyrption/mbedtls/programs/pkey/rsa_decrypt.d ./Encyrption/mbedtls/programs/pkey/rsa_decrypt.o ./Encyrption/mbedtls/programs/pkey/rsa_decrypt.su ./Encyrption/mbedtls/programs/pkey/rsa_encrypt.cyclo ./Encyrption/mbedtls/programs/pkey/rsa_encrypt.d ./Encyrption/mbedtls/programs/pkey/rsa_encrypt.o ./Encyrption/mbedtls/programs/pkey/rsa_encrypt.su ./Encyrption/mbedtls/programs/pkey/rsa_genkey.cyclo ./Encyrption/mbedtls/programs/pkey/rsa_genkey.d ./Encyrption/mbedtls/programs/pkey/rsa_genkey.o ./Encyrption/mbedtls/programs/pkey/rsa_genkey.su ./Encyrption/mbedtls/programs/pkey/rsa_sign.cyclo ./Encyrption/mbedtls/programs/pkey/rsa_sign.d ./Encyrption/mbedtls/programs/pkey/rsa_sign.o ./Encyrption/mbedtls/programs/pkey/rsa_sign.su ./Encyrption/mbedtls/programs/pkey/rsa_sign_pss.cyclo ./Encyrption/mbedtls/programs/pkey/rsa_sign_pss.d ./Encyrption/mbedtls/programs/pkey/rsa_sign_pss.o ./Encyrption/mbedtls/programs/pkey/rsa_sign_pss.su ./Encyrption/mbedtls/programs/pkey/rsa_verify.cyclo ./Encyrption/mbedtls/programs/pkey/rsa_verify.d ./Encyrption/mbedtls/programs/pkey/rsa_verify.o ./Encyrption/mbedtls/programs/pkey/rsa_verify.su ./Encyrption/mbedtls/programs/pkey/rsa_verify_pss.cyclo ./Encyrption/mbedtls/programs/pkey/rsa_verify_pss.d ./Encyrption/mbedtls/programs/pkey/rsa_verify_pss.o ./Encyrption/mbedtls/programs/pkey/rsa_verify_pss.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-pkey

