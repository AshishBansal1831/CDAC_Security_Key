################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/core/psa_crypto.c \
../Encyrption/core/psa_crypto_aead.c \
../Encyrption/core/psa_crypto_cipher.c \
../Encyrption/core/psa_crypto_client.c \
../Encyrption/core/psa_crypto_ecp.c \
../Encyrption/core/psa_crypto_ffdh.c \
../Encyrption/core/psa_crypto_hash.c \
../Encyrption/core/psa_crypto_mac.c \
../Encyrption/core/psa_crypto_pake.c \
../Encyrption/core/psa_crypto_rsa.c \
../Encyrption/core/psa_crypto_se.c \
../Encyrption/core/psa_crypto_slot_management.c \
../Encyrption/core/psa_crypto_storage.c \
../Encyrption/core/psa_its_file.c \
../Encyrption/core/psa_util.c 

C_DEPS += \
./Encyrption/core/psa_crypto.d \
./Encyrption/core/psa_crypto_aead.d \
./Encyrption/core/psa_crypto_cipher.d \
./Encyrption/core/psa_crypto_client.d \
./Encyrption/core/psa_crypto_ecp.d \
./Encyrption/core/psa_crypto_ffdh.d \
./Encyrption/core/psa_crypto_hash.d \
./Encyrption/core/psa_crypto_mac.d \
./Encyrption/core/psa_crypto_pake.d \
./Encyrption/core/psa_crypto_rsa.d \
./Encyrption/core/psa_crypto_se.d \
./Encyrption/core/psa_crypto_slot_management.d \
./Encyrption/core/psa_crypto_storage.d \
./Encyrption/core/psa_its_file.d \
./Encyrption/core/psa_util.d 

OBJS += \
./Encyrption/core/psa_crypto.o \
./Encyrption/core/psa_crypto_aead.o \
./Encyrption/core/psa_crypto_cipher.o \
./Encyrption/core/psa_crypto_client.o \
./Encyrption/core/psa_crypto_ecp.o \
./Encyrption/core/psa_crypto_ffdh.o \
./Encyrption/core/psa_crypto_hash.o \
./Encyrption/core/psa_crypto_mac.o \
./Encyrption/core/psa_crypto_pake.o \
./Encyrption/core/psa_crypto_rsa.o \
./Encyrption/core/psa_crypto_se.o \
./Encyrption/core/psa_crypto_slot_management.o \
./Encyrption/core/psa_crypto_storage.o \
./Encyrption/core/psa_its_file.o \
./Encyrption/core/psa_util.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/core/%.o Encyrption/core/%.su Encyrption/core/%.cyclo: ../Encyrption/core/%.c Encyrption/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/include" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-core

clean-Encyrption-2f-core:
	-$(RM) ./Encyrption/core/psa_crypto.cyclo ./Encyrption/core/psa_crypto.d ./Encyrption/core/psa_crypto.o ./Encyrption/core/psa_crypto.su ./Encyrption/core/psa_crypto_aead.cyclo ./Encyrption/core/psa_crypto_aead.d ./Encyrption/core/psa_crypto_aead.o ./Encyrption/core/psa_crypto_aead.su ./Encyrption/core/psa_crypto_cipher.cyclo ./Encyrption/core/psa_crypto_cipher.d ./Encyrption/core/psa_crypto_cipher.o ./Encyrption/core/psa_crypto_cipher.su ./Encyrption/core/psa_crypto_client.cyclo ./Encyrption/core/psa_crypto_client.d ./Encyrption/core/psa_crypto_client.o ./Encyrption/core/psa_crypto_client.su ./Encyrption/core/psa_crypto_ecp.cyclo ./Encyrption/core/psa_crypto_ecp.d ./Encyrption/core/psa_crypto_ecp.o ./Encyrption/core/psa_crypto_ecp.su ./Encyrption/core/psa_crypto_ffdh.cyclo ./Encyrption/core/psa_crypto_ffdh.d ./Encyrption/core/psa_crypto_ffdh.o ./Encyrption/core/psa_crypto_ffdh.su ./Encyrption/core/psa_crypto_hash.cyclo ./Encyrption/core/psa_crypto_hash.d ./Encyrption/core/psa_crypto_hash.o ./Encyrption/core/psa_crypto_hash.su ./Encyrption/core/psa_crypto_mac.cyclo ./Encyrption/core/psa_crypto_mac.d ./Encyrption/core/psa_crypto_mac.o ./Encyrption/core/psa_crypto_mac.su ./Encyrption/core/psa_crypto_pake.cyclo ./Encyrption/core/psa_crypto_pake.d ./Encyrption/core/psa_crypto_pake.o ./Encyrption/core/psa_crypto_pake.su ./Encyrption/core/psa_crypto_rsa.cyclo ./Encyrption/core/psa_crypto_rsa.d ./Encyrption/core/psa_crypto_rsa.o ./Encyrption/core/psa_crypto_rsa.su ./Encyrption/core/psa_crypto_se.cyclo ./Encyrption/core/psa_crypto_se.d ./Encyrption/core/psa_crypto_se.o ./Encyrption/core/psa_crypto_se.su ./Encyrption/core/psa_crypto_slot_management.cyclo ./Encyrption/core/psa_crypto_slot_management.d ./Encyrption/core/psa_crypto_slot_management.o ./Encyrption/core/psa_crypto_slot_management.su ./Encyrption/core/psa_crypto_storage.cyclo ./Encyrption/core/psa_crypto_storage.d ./Encyrption/core/psa_crypto_storage.o ./Encyrption/core/psa_crypto_storage.su ./Encyrption/core/psa_its_file.cyclo ./Encyrption/core/psa_its_file.d ./Encyrption/core/psa_its_file.o ./Encyrption/core/psa_its_file.su ./Encyrption/core/psa_util.cyclo ./Encyrption/core/psa_util.d ./Encyrption/core/psa_util.o ./Encyrption/core/psa_util.su

.PHONY: clean-Encyrption-2f-core

