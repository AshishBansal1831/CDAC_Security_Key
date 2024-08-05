################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt128_extracted.c \
../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt64_FStar_UInt32_FStar_UInt16_FStar_UInt8.c 

C_DEPS += \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt128_extracted.d \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt64_FStar_UInt32_FStar_UInt16_FStar_UInt8.d 

OBJS += \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt128_extracted.o \
./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt64_FStar_UInt32_FStar_UInt16_FStar_UInt8.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/%.o Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/%.su Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/%.cyclo: ../Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/%.c Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-everest-2f-library-2f-kremlib

clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-everest-2f-library-2f-kremlib:
	-$(RM) ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt128_extracted.cyclo ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt128_extracted.d ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt128_extracted.o ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt128_extracted.su ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt64_FStar_UInt32_FStar_UInt16_FStar_UInt8.cyclo ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt64_FStar_UInt32_FStar_UInt16_FStar_UInt8.d ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt64_FStar_UInt32_FStar_UInt16_FStar_UInt8.o ./Encyrption/mbedtls/tf-psa-crypto/drivers/everest/library/kremlib/FStar_UInt64_FStar_UInt32_FStar_UInt16_FStar_UInt8.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-tf-2d-psa-2d-crypto-2f-drivers-2f-everest-2f-library-2f-kremlib

