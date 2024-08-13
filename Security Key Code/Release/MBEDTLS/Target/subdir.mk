################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MBEDTLS/Target/hardware_rng.c 

C_DEPS += \
./MBEDTLS/Target/hardware_rng.d 

OBJS += \
./MBEDTLS/Target/hardware_rng.o 


# Each subdirectory must supply rules for building sources it contributes
MBEDTLS/Target/%.o MBEDTLS/Target/%.su MBEDTLS/Target/%.cyclo: ../MBEDTLS/Target/%.c MBEDTLS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx '-DMBEDTLS_CONFIG_FILE=<mbedtls_config.h>' -c -I"D:/CDAC/CDAC-Project/Security Key/mbedTLS/CDAC_Security_Key/Security Key Code/Encyrption/wolfssl" -I"D:/CDAC/CDAC-Project/Security Key/mbedTLS/CDAC_Security_Key/Security Key Code/Encyrption" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -I../MBEDTLS/App -I../Middlewares/Third_Party/mbedTLS/include/mbedtls -I../Middlewares/Third_Party/mbedTLS/include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MBEDTLS-2f-Target

clean-MBEDTLS-2f-Target:
	-$(RM) ./MBEDTLS/Target/hardware_rng.cyclo ./MBEDTLS/Target/hardware_rng.d ./MBEDTLS/Target/hardware_rng.o ./MBEDTLS/Target/hardware_rng.su

.PHONY: clean-MBEDTLS-2f-Target

