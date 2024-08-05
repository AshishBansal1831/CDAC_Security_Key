################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/tests/src/drivers/hash.c \
../Encyrption/mbedtls/tests/src/drivers/platform_builtin_keys.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_aead.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_asymmetric_encryption.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_cipher.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_key_agreement.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_key_management.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_mac.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_pake.c \
../Encyrption/mbedtls/tests/src/drivers/test_driver_signature.c 

C_DEPS += \
./Encyrption/mbedtls/tests/src/drivers/hash.d \
./Encyrption/mbedtls/tests/src/drivers/platform_builtin_keys.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_aead.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_asymmetric_encryption.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_cipher.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_key_agreement.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_key_management.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_mac.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_pake.d \
./Encyrption/mbedtls/tests/src/drivers/test_driver_signature.d 

OBJS += \
./Encyrption/mbedtls/tests/src/drivers/hash.o \
./Encyrption/mbedtls/tests/src/drivers/platform_builtin_keys.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_aead.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_asymmetric_encryption.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_cipher.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_key_agreement.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_key_management.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_mac.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_pake.o \
./Encyrption/mbedtls/tests/src/drivers/test_driver_signature.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/tests/src/drivers/%.o Encyrption/mbedtls/tests/src/drivers/%.su Encyrption/mbedtls/tests/src/drivers/%.cyclo: ../Encyrption/mbedtls/tests/src/drivers/%.c Encyrption/mbedtls/tests/src/drivers/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-tests-2f-src-2f-drivers

clean-Encyrption-2f-mbedtls-2f-tests-2f-src-2f-drivers:
	-$(RM) ./Encyrption/mbedtls/tests/src/drivers/hash.cyclo ./Encyrption/mbedtls/tests/src/drivers/hash.d ./Encyrption/mbedtls/tests/src/drivers/hash.o ./Encyrption/mbedtls/tests/src/drivers/hash.su ./Encyrption/mbedtls/tests/src/drivers/platform_builtin_keys.cyclo ./Encyrption/mbedtls/tests/src/drivers/platform_builtin_keys.d ./Encyrption/mbedtls/tests/src/drivers/platform_builtin_keys.o ./Encyrption/mbedtls/tests/src/drivers/platform_builtin_keys.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_aead.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_aead.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_aead.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_aead.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_asymmetric_encryption.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_asymmetric_encryption.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_asymmetric_encryption.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_asymmetric_encryption.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_cipher.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_cipher.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_cipher.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_cipher.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_agreement.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_agreement.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_agreement.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_agreement.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_management.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_management.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_management.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_key_management.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_mac.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_mac.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_mac.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_mac.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_pake.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_pake.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_pake.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_pake.su ./Encyrption/mbedtls/tests/src/drivers/test_driver_signature.cyclo ./Encyrption/mbedtls/tests/src/drivers/test_driver_signature.d ./Encyrption/mbedtls/tests/src/drivers/test_driver_signature.o ./Encyrption/mbedtls/tests/src/drivers/test_driver_signature.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-tests-2f-src-2f-drivers

