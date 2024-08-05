################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_aead.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_cipher.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_client.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ecp.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ffdh.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_hash.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_mac.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_pake.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_rsa.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_se.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_slot_management.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_storage.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_its_file.c \
../Encyrption/mbedtls/tf-psa-crypto/core/psa_util.c 

C_DEPS += \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_aead.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_cipher.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_client.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ecp.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ffdh.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_hash.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_mac.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_pake.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_rsa.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_se.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_slot_management.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_storage.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_its_file.d \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_util.d 

OBJS += \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_aead.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_cipher.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_client.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ecp.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ffdh.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_hash.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_mac.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_pake.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_rsa.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_se.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_slot_management.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_storage.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_its_file.o \
./Encyrption/mbedtls/tf-psa-crypto/core/psa_util.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/tf-psa-crypto/core/%.o Encyrption/mbedtls/tf-psa-crypto/core/%.su Encyrption/mbedtls/tf-psa-crypto/core/%.cyclo: ../Encyrption/mbedtls/tf-psa-crypto/core/%.c Encyrption/mbedtls/tf-psa-crypto/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-core

clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-core:
	-$(RM) ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_aead.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_aead.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_aead.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_aead.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_cipher.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_cipher.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_cipher.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_cipher.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_client.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_client.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_client.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_client.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ecp.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ecp.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ecp.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ecp.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ffdh.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ffdh.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ffdh.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_ffdh.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_hash.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_hash.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_hash.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_hash.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_mac.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_mac.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_mac.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_mac.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_pake.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_pake.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_pake.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_pake.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_rsa.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_rsa.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_rsa.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_rsa.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_se.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_se.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_se.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_se.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_slot_management.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_slot_management.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_slot_management.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_slot_management.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_storage.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_storage.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_storage.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_crypto_storage.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_its_file.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_its_file.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_its_file.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_its_file.su ./Encyrption/mbedtls/tf-psa-crypto/core/psa_util.cyclo ./Encyrption/mbedtls/tf-psa-crypto/core/psa_util.d ./Encyrption/mbedtls/tf-psa-crypto/core/psa_util.o ./Encyrption/mbedtls/tf-psa-crypto/core/psa_util.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-core

