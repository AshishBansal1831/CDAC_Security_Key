################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/hash/generic_sum.c \
../Encyrption/mbedtls/programs/hash/hello.c \
../Encyrption/mbedtls/programs/hash/md_hmac_demo.c 

C_DEPS += \
./Encyrption/mbedtls/programs/hash/generic_sum.d \
./Encyrption/mbedtls/programs/hash/hello.d \
./Encyrption/mbedtls/programs/hash/md_hmac_demo.d 

OBJS += \
./Encyrption/mbedtls/programs/hash/generic_sum.o \
./Encyrption/mbedtls/programs/hash/hello.o \
./Encyrption/mbedtls/programs/hash/md_hmac_demo.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/hash/%.o Encyrption/mbedtls/programs/hash/%.su Encyrption/mbedtls/programs/hash/%.cyclo: ../Encyrption/mbedtls/programs/hash/%.c Encyrption/mbedtls/programs/hash/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-hash

clean-Encyrption-2f-mbedtls-2f-programs-2f-hash:
	-$(RM) ./Encyrption/mbedtls/programs/hash/generic_sum.cyclo ./Encyrption/mbedtls/programs/hash/generic_sum.d ./Encyrption/mbedtls/programs/hash/generic_sum.o ./Encyrption/mbedtls/programs/hash/generic_sum.su ./Encyrption/mbedtls/programs/hash/hello.cyclo ./Encyrption/mbedtls/programs/hash/hello.d ./Encyrption/mbedtls/programs/hash/hello.o ./Encyrption/mbedtls/programs/hash/hello.su ./Encyrption/mbedtls/programs/hash/md_hmac_demo.cyclo ./Encyrption/mbedtls/programs/hash/md_hmac_demo.d ./Encyrption/mbedtls/programs/hash/md_hmac_demo.o ./Encyrption/mbedtls/programs/hash/md_hmac_demo.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-hash

