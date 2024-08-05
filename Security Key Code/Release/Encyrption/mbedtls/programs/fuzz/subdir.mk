################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/fuzz/common.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_client.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_dtlsclient.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_dtlsserver.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_pkcs7.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_privkey.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_pubkey.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_server.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_x509crl.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_x509crt.c \
../Encyrption/mbedtls/programs/fuzz/fuzz_x509csr.c \
../Encyrption/mbedtls/programs/fuzz/onefile.c 

C_DEPS += \
./Encyrption/mbedtls/programs/fuzz/common.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_client.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsclient.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsserver.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_pkcs7.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_privkey.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_pubkey.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_server.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_x509crl.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_x509crt.d \
./Encyrption/mbedtls/programs/fuzz/fuzz_x509csr.d \
./Encyrption/mbedtls/programs/fuzz/onefile.d 

OBJS += \
./Encyrption/mbedtls/programs/fuzz/common.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_client.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsclient.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsserver.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_pkcs7.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_privkey.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_pubkey.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_server.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_x509crl.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_x509crt.o \
./Encyrption/mbedtls/programs/fuzz/fuzz_x509csr.o \
./Encyrption/mbedtls/programs/fuzz/onefile.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/fuzz/%.o Encyrption/mbedtls/programs/fuzz/%.su Encyrption/mbedtls/programs/fuzz/%.cyclo: ../Encyrption/mbedtls/programs/fuzz/%.c Encyrption/mbedtls/programs/fuzz/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-fuzz

clean-Encyrption-2f-mbedtls-2f-programs-2f-fuzz:
	-$(RM) ./Encyrption/mbedtls/programs/fuzz/common.cyclo ./Encyrption/mbedtls/programs/fuzz/common.d ./Encyrption/mbedtls/programs/fuzz/common.o ./Encyrption/mbedtls/programs/fuzz/common.su ./Encyrption/mbedtls/programs/fuzz/fuzz_client.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_client.d ./Encyrption/mbedtls/programs/fuzz/fuzz_client.o ./Encyrption/mbedtls/programs/fuzz/fuzz_client.su ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsclient.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsclient.d ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsclient.o ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsclient.su ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsserver.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsserver.d ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsserver.o ./Encyrption/mbedtls/programs/fuzz/fuzz_dtlsserver.su ./Encyrption/mbedtls/programs/fuzz/fuzz_pkcs7.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_pkcs7.d ./Encyrption/mbedtls/programs/fuzz/fuzz_pkcs7.o ./Encyrption/mbedtls/programs/fuzz/fuzz_pkcs7.su ./Encyrption/mbedtls/programs/fuzz/fuzz_privkey.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_privkey.d ./Encyrption/mbedtls/programs/fuzz/fuzz_privkey.o ./Encyrption/mbedtls/programs/fuzz/fuzz_privkey.su ./Encyrption/mbedtls/programs/fuzz/fuzz_pubkey.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_pubkey.d ./Encyrption/mbedtls/programs/fuzz/fuzz_pubkey.o ./Encyrption/mbedtls/programs/fuzz/fuzz_pubkey.su ./Encyrption/mbedtls/programs/fuzz/fuzz_server.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_server.d ./Encyrption/mbedtls/programs/fuzz/fuzz_server.o ./Encyrption/mbedtls/programs/fuzz/fuzz_server.su ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crl.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crl.d ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crl.o ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crl.su ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crt.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crt.d ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crt.o ./Encyrption/mbedtls/programs/fuzz/fuzz_x509crt.su ./Encyrption/mbedtls/programs/fuzz/fuzz_x509csr.cyclo ./Encyrption/mbedtls/programs/fuzz/fuzz_x509csr.d ./Encyrption/mbedtls/programs/fuzz/fuzz_x509csr.o ./Encyrption/mbedtls/programs/fuzz/fuzz_x509csr.su ./Encyrption/mbedtls/programs/fuzz/onefile.cyclo ./Encyrption/mbedtls/programs/fuzz/onefile.d ./Encyrption/mbedtls/programs/fuzz/onefile.o ./Encyrption/mbedtls/programs/fuzz/onefile.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-fuzz

