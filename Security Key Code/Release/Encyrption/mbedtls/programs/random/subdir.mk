################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/random/gen_entropy.c \
../Encyrption/mbedtls/programs/random/gen_random_ctr_drbg.c 

C_DEPS += \
./Encyrption/mbedtls/programs/random/gen_entropy.d \
./Encyrption/mbedtls/programs/random/gen_random_ctr_drbg.d 

OBJS += \
./Encyrption/mbedtls/programs/random/gen_entropy.o \
./Encyrption/mbedtls/programs/random/gen_random_ctr_drbg.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/random/%.o Encyrption/mbedtls/programs/random/%.su Encyrption/mbedtls/programs/random/%.cyclo: ../Encyrption/mbedtls/programs/random/%.c Encyrption/mbedtls/programs/random/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-random

clean-Encyrption-2f-mbedtls-2f-programs-2f-random:
	-$(RM) ./Encyrption/mbedtls/programs/random/gen_entropy.cyclo ./Encyrption/mbedtls/programs/random/gen_entropy.d ./Encyrption/mbedtls/programs/random/gen_entropy.o ./Encyrption/mbedtls/programs/random/gen_entropy.su ./Encyrption/mbedtls/programs/random/gen_random_ctr_drbg.cyclo ./Encyrption/mbedtls/programs/random/gen_random_ctr_drbg.d ./Encyrption/mbedtls/programs/random/gen_random_ctr_drbg.o ./Encyrption/mbedtls/programs/random/gen_random_ctr_drbg.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-random

