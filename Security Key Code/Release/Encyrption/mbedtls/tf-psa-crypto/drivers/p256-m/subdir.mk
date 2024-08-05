################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m_driver_entrypoints.c 

C_DEPS += \
./Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m_driver_entrypoints.d 

OBJS += \
./Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m_driver_entrypoints.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/%.o Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/%.su Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/%.cyclo: ../Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/%.c Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-p256-2d-m

clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-p256-2d-m:
	-$(RM) ./Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m_driver_entrypoints.cyclo ./Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m_driver_entrypoints.d ./Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m_driver_entrypoints.o ./Encyrption/mbedtls/tf-psa-crypto/drivers/p256-m/p256-m_driver_entrypoints.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-p256-2d-m

