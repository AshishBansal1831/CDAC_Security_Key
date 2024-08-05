################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/psa/aead_demo.c \
../Encyrption/mbedtls/programs/psa/crypto_examples.c \
../Encyrption/mbedtls/programs/psa/hmac_demo.c \
../Encyrption/mbedtls/programs/psa/key_ladder_demo.c \
../Encyrption/mbedtls/programs/psa/psa_constant_names.c \
../Encyrption/mbedtls/programs/psa/psa_hash.c 

C_DEPS += \
./Encyrption/mbedtls/programs/psa/aead_demo.d \
./Encyrption/mbedtls/programs/psa/crypto_examples.d \
./Encyrption/mbedtls/programs/psa/hmac_demo.d \
./Encyrption/mbedtls/programs/psa/key_ladder_demo.d \
./Encyrption/mbedtls/programs/psa/psa_constant_names.d \
./Encyrption/mbedtls/programs/psa/psa_hash.d 

OBJS += \
./Encyrption/mbedtls/programs/psa/aead_demo.o \
./Encyrption/mbedtls/programs/psa/crypto_examples.o \
./Encyrption/mbedtls/programs/psa/hmac_demo.o \
./Encyrption/mbedtls/programs/psa/key_ladder_demo.o \
./Encyrption/mbedtls/programs/psa/psa_constant_names.o \
./Encyrption/mbedtls/programs/psa/psa_hash.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/psa/%.o Encyrption/mbedtls/programs/psa/%.su Encyrption/mbedtls/programs/psa/%.cyclo: ../Encyrption/mbedtls/programs/psa/%.c Encyrption/mbedtls/programs/psa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-psa

clean-Encyrption-2f-mbedtls-2f-programs-2f-psa:
	-$(RM) ./Encyrption/mbedtls/programs/psa/aead_demo.cyclo ./Encyrption/mbedtls/programs/psa/aead_demo.d ./Encyrption/mbedtls/programs/psa/aead_demo.o ./Encyrption/mbedtls/programs/psa/aead_demo.su ./Encyrption/mbedtls/programs/psa/crypto_examples.cyclo ./Encyrption/mbedtls/programs/psa/crypto_examples.d ./Encyrption/mbedtls/programs/psa/crypto_examples.o ./Encyrption/mbedtls/programs/psa/crypto_examples.su ./Encyrption/mbedtls/programs/psa/hmac_demo.cyclo ./Encyrption/mbedtls/programs/psa/hmac_demo.d ./Encyrption/mbedtls/programs/psa/hmac_demo.o ./Encyrption/mbedtls/programs/psa/hmac_demo.su ./Encyrption/mbedtls/programs/psa/key_ladder_demo.cyclo ./Encyrption/mbedtls/programs/psa/key_ladder_demo.d ./Encyrption/mbedtls/programs/psa/key_ladder_demo.o ./Encyrption/mbedtls/programs/psa/key_ladder_demo.su ./Encyrption/mbedtls/programs/psa/psa_constant_names.cyclo ./Encyrption/mbedtls/programs/psa/psa_constant_names.d ./Encyrption/mbedtls/programs/psa/psa_constant_names.o ./Encyrption/mbedtls/programs/psa/psa_constant_names.su ./Encyrption/mbedtls/programs/psa/psa_hash.cyclo ./Encyrption/mbedtls/programs/psa/psa_hash.d ./Encyrption/mbedtls/programs/psa/psa_hash.o ./Encyrption/mbedtls/programs/psa/psa_hash.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-psa

