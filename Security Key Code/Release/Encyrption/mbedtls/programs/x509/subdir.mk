################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/x509/cert_app.c \
../Encyrption/mbedtls/programs/x509/cert_req.c \
../Encyrption/mbedtls/programs/x509/cert_write.c \
../Encyrption/mbedtls/programs/x509/crl_app.c \
../Encyrption/mbedtls/programs/x509/load_roots.c \
../Encyrption/mbedtls/programs/x509/req_app.c 

C_DEPS += \
./Encyrption/mbedtls/programs/x509/cert_app.d \
./Encyrption/mbedtls/programs/x509/cert_req.d \
./Encyrption/mbedtls/programs/x509/cert_write.d \
./Encyrption/mbedtls/programs/x509/crl_app.d \
./Encyrption/mbedtls/programs/x509/load_roots.d \
./Encyrption/mbedtls/programs/x509/req_app.d 

OBJS += \
./Encyrption/mbedtls/programs/x509/cert_app.o \
./Encyrption/mbedtls/programs/x509/cert_req.o \
./Encyrption/mbedtls/programs/x509/cert_write.o \
./Encyrption/mbedtls/programs/x509/crl_app.o \
./Encyrption/mbedtls/programs/x509/load_roots.o \
./Encyrption/mbedtls/programs/x509/req_app.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/x509/%.o Encyrption/mbedtls/programs/x509/%.su Encyrption/mbedtls/programs/x509/%.cyclo: ../Encyrption/mbedtls/programs/x509/%.c Encyrption/mbedtls/programs/x509/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-x509

clean-Encyrption-2f-mbedtls-2f-programs-2f-x509:
	-$(RM) ./Encyrption/mbedtls/programs/x509/cert_app.cyclo ./Encyrption/mbedtls/programs/x509/cert_app.d ./Encyrption/mbedtls/programs/x509/cert_app.o ./Encyrption/mbedtls/programs/x509/cert_app.su ./Encyrption/mbedtls/programs/x509/cert_req.cyclo ./Encyrption/mbedtls/programs/x509/cert_req.d ./Encyrption/mbedtls/programs/x509/cert_req.o ./Encyrption/mbedtls/programs/x509/cert_req.su ./Encyrption/mbedtls/programs/x509/cert_write.cyclo ./Encyrption/mbedtls/programs/x509/cert_write.d ./Encyrption/mbedtls/programs/x509/cert_write.o ./Encyrption/mbedtls/programs/x509/cert_write.su ./Encyrption/mbedtls/programs/x509/crl_app.cyclo ./Encyrption/mbedtls/programs/x509/crl_app.d ./Encyrption/mbedtls/programs/x509/crl_app.o ./Encyrption/mbedtls/programs/x509/crl_app.su ./Encyrption/mbedtls/programs/x509/load_roots.cyclo ./Encyrption/mbedtls/programs/x509/load_roots.d ./Encyrption/mbedtls/programs/x509/load_roots.o ./Encyrption/mbedtls/programs/x509/load_roots.su ./Encyrption/mbedtls/programs/x509/req_app.cyclo ./Encyrption/mbedtls/programs/x509/req_app.d ./Encyrption/mbedtls/programs/x509/req_app.o ./Encyrption/mbedtls/programs/x509/req_app.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-x509

