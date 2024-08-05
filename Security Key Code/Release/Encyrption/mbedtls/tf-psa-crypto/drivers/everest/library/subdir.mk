################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519.c \
../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519_joined.c \
../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/everest.c \
../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/x25519.c 

C_DEPS += \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519.d \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519_joined.d \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/everest.d \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/x25519.d 

OBJS += \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519.o \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519_joined.o \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/everest.o \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/x25519.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/%.o Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/%.su Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/%.cyclo: ../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/%.c Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-everest-2f-library

clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-everest-2f-library:
	-$(RM) ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519.cyclo ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519.d ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519.o ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519.su ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519_joined.cyclo ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519_joined.d ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519_joined.o ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/Hacl_Curve25519_joined.su ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/everest.cyclo ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/everest.d ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/everest.o ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/everest.su ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/x25519.cyclo ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/x25519.d ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/x25519.o ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/x25519.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-everest-2f-library

