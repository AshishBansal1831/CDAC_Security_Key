################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/library/debug.c \
../Encyrption/mbedtls/library/mps_reader.c \
../Encyrption/mbedtls/library/mps_trace.c \
../Encyrption/mbedtls/library/net_sockets.c \
../Encyrption/mbedtls/library/pkcs7.c \
../Encyrption/mbedtls/library/ssl_cache.c \
../Encyrption/mbedtls/library/ssl_ciphersuites.c \
../Encyrption/mbedtls/library/ssl_client.c \
../Encyrption/mbedtls/library/ssl_cookie.c \
../Encyrption/mbedtls/library/ssl_msg.c \
../Encyrption/mbedtls/library/ssl_ticket.c \
../Encyrption/mbedtls/library/ssl_tls.c \
../Encyrption/mbedtls/library/ssl_tls12_client.c \
../Encyrption/mbedtls/library/ssl_tls12_server.c \
../Encyrption/mbedtls/library/ssl_tls13_client.c \
../Encyrption/mbedtls/library/ssl_tls13_generic.c \
../Encyrption/mbedtls/library/ssl_tls13_keys.c \
../Encyrption/mbedtls/library/ssl_tls13_server.c \
../Encyrption/mbedtls/library/x509.c \
../Encyrption/mbedtls/library/x509_create.c \
../Encyrption/mbedtls/library/x509_crl.c \
../Encyrption/mbedtls/library/x509_crt.c \
../Encyrption/mbedtls/library/x509_csr.c \
../Encyrption/mbedtls/library/x509write.c \
../Encyrption/mbedtls/library/x509write_crt.c \
../Encyrption/mbedtls/library/x509write_csr.c 

C_DEPS += \
./Encyrption/mbedtls/library/debug.d \
./Encyrption/mbedtls/library/mps_reader.d \
./Encyrption/mbedtls/library/mps_trace.d \
./Encyrption/mbedtls/library/net_sockets.d \
./Encyrption/mbedtls/library/pkcs7.d \
./Encyrption/mbedtls/library/ssl_cache.d \
./Encyrption/mbedtls/library/ssl_ciphersuites.d \
./Encyrption/mbedtls/library/ssl_client.d \
./Encyrption/mbedtls/library/ssl_cookie.d \
./Encyrption/mbedtls/library/ssl_msg.d \
./Encyrption/mbedtls/library/ssl_ticket.d \
./Encyrption/mbedtls/library/ssl_tls.d \
./Encyrption/mbedtls/library/ssl_tls12_client.d \
./Encyrption/mbedtls/library/ssl_tls12_server.d \
./Encyrption/mbedtls/library/ssl_tls13_client.d \
./Encyrption/mbedtls/library/ssl_tls13_generic.d \
./Encyrption/mbedtls/library/ssl_tls13_keys.d \
./Encyrption/mbedtls/library/ssl_tls13_server.d \
./Encyrption/mbedtls/library/x509.d \
./Encyrption/mbedtls/library/x509_create.d \
./Encyrption/mbedtls/library/x509_crl.d \
./Encyrption/mbedtls/library/x509_crt.d \
./Encyrption/mbedtls/library/x509_csr.d \
./Encyrption/mbedtls/library/x509write.d \
./Encyrption/mbedtls/library/x509write_crt.d \
./Encyrption/mbedtls/library/x509write_csr.d 

OBJS += \
./Encyrption/mbedtls/library/debug.o \
./Encyrption/mbedtls/library/mps_reader.o \
./Encyrption/mbedtls/library/mps_trace.o \
./Encyrption/mbedtls/library/net_sockets.o \
./Encyrption/mbedtls/library/pkcs7.o \
./Encyrption/mbedtls/library/ssl_cache.o \
./Encyrption/mbedtls/library/ssl_ciphersuites.o \
./Encyrption/mbedtls/library/ssl_client.o \
./Encyrption/mbedtls/library/ssl_cookie.o \
./Encyrption/mbedtls/library/ssl_msg.o \
./Encyrption/mbedtls/library/ssl_ticket.o \
./Encyrption/mbedtls/library/ssl_tls.o \
./Encyrption/mbedtls/library/ssl_tls12_client.o \
./Encyrption/mbedtls/library/ssl_tls12_server.o \
./Encyrption/mbedtls/library/ssl_tls13_client.o \
./Encyrption/mbedtls/library/ssl_tls13_generic.o \
./Encyrption/mbedtls/library/ssl_tls13_keys.o \
./Encyrption/mbedtls/library/ssl_tls13_server.o \
./Encyrption/mbedtls/library/x509.o \
./Encyrption/mbedtls/library/x509_create.o \
./Encyrption/mbedtls/library/x509_crl.o \
./Encyrption/mbedtls/library/x509_crt.o \
./Encyrption/mbedtls/library/x509_csr.o \
./Encyrption/mbedtls/library/x509write.o \
./Encyrption/mbedtls/library/x509write_crt.o \
./Encyrption/mbedtls/library/x509write_csr.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/library/%.o Encyrption/mbedtls/library/%.su Encyrption/mbedtls/library/%.cyclo: ../Encyrption/mbedtls/library/%.c Encyrption/mbedtls/library/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-library

clean-Encyrption-2f-mbedtls-2f-library:
	-$(RM) ./Encyrption/mbedtls/library/debug.cyclo ./Encyrption/mbedtls/library/debug.d ./Encyrption/mbedtls/library/debug.o ./Encyrption/mbedtls/library/debug.su ./Encyrption/mbedtls/library/mps_reader.cyclo ./Encyrption/mbedtls/library/mps_reader.d ./Encyrption/mbedtls/library/mps_reader.o ./Encyrption/mbedtls/library/mps_reader.su ./Encyrption/mbedtls/library/mps_trace.cyclo ./Encyrption/mbedtls/library/mps_trace.d ./Encyrption/mbedtls/library/mps_trace.o ./Encyrption/mbedtls/library/mps_trace.su ./Encyrption/mbedtls/library/net_sockets.cyclo ./Encyrption/mbedtls/library/net_sockets.d ./Encyrption/mbedtls/library/net_sockets.o ./Encyrption/mbedtls/library/net_sockets.su ./Encyrption/mbedtls/library/pkcs7.cyclo ./Encyrption/mbedtls/library/pkcs7.d ./Encyrption/mbedtls/library/pkcs7.o ./Encyrption/mbedtls/library/pkcs7.su ./Encyrption/mbedtls/library/ssl_cache.cyclo ./Encyrption/mbedtls/library/ssl_cache.d ./Encyrption/mbedtls/library/ssl_cache.o ./Encyrption/mbedtls/library/ssl_cache.su ./Encyrption/mbedtls/library/ssl_ciphersuites.cyclo ./Encyrption/mbedtls/library/ssl_ciphersuites.d ./Encyrption/mbedtls/library/ssl_ciphersuites.o ./Encyrption/mbedtls/library/ssl_ciphersuites.su ./Encyrption/mbedtls/library/ssl_client.cyclo ./Encyrption/mbedtls/library/ssl_client.d ./Encyrption/mbedtls/library/ssl_client.o ./Encyrption/mbedtls/library/ssl_client.su ./Encyrption/mbedtls/library/ssl_cookie.cyclo ./Encyrption/mbedtls/library/ssl_cookie.d ./Encyrption/mbedtls/library/ssl_cookie.o ./Encyrption/mbedtls/library/ssl_cookie.su ./Encyrption/mbedtls/library/ssl_msg.cyclo ./Encyrption/mbedtls/library/ssl_msg.d ./Encyrption/mbedtls/library/ssl_msg.o ./Encyrption/mbedtls/library/ssl_msg.su ./Encyrption/mbedtls/library/ssl_ticket.cyclo ./Encyrption/mbedtls/library/ssl_ticket.d ./Encyrption/mbedtls/library/ssl_ticket.o ./Encyrption/mbedtls/library/ssl_ticket.su ./Encyrption/mbedtls/library/ssl_tls.cyclo ./Encyrption/mbedtls/library/ssl_tls.d ./Encyrption/mbedtls/library/ssl_tls.o ./Encyrption/mbedtls/library/ssl_tls.su ./Encyrption/mbedtls/library/ssl_tls12_client.cyclo ./Encyrption/mbedtls/library/ssl_tls12_client.d ./Encyrption/mbedtls/library/ssl_tls12_client.o ./Encyrption/mbedtls/library/ssl_tls12_client.su ./Encyrption/mbedtls/library/ssl_tls12_server.cyclo ./Encyrption/mbedtls/library/ssl_tls12_server.d ./Encyrption/mbedtls/library/ssl_tls12_server.o ./Encyrption/mbedtls/library/ssl_tls12_server.su ./Encyrption/mbedtls/library/ssl_tls13_client.cyclo ./Encyrption/mbedtls/library/ssl_tls13_client.d ./Encyrption/mbedtls/library/ssl_tls13_client.o ./Encyrption/mbedtls/library/ssl_tls13_client.su ./Encyrption/mbedtls/library/ssl_tls13_generic.cyclo ./Encyrption/mbedtls/library/ssl_tls13_generic.d ./Encyrption/mbedtls/library/ssl_tls13_generic.o ./Encyrption/mbedtls/library/ssl_tls13_generic.su ./Encyrption/mbedtls/library/ssl_tls13_keys.cyclo ./Encyrption/mbedtls/library/ssl_tls13_keys.d ./Encyrption/mbedtls/library/ssl_tls13_keys.o ./Encyrption/mbedtls/library/ssl_tls13_keys.su ./Encyrption/mbedtls/library/ssl_tls13_server.cyclo ./Encyrption/mbedtls/library/ssl_tls13_server.d ./Encyrption/mbedtls/library/ssl_tls13_server.o ./Encyrption/mbedtls/library/ssl_tls13_server.su ./Encyrption/mbedtls/library/x509.cyclo ./Encyrption/mbedtls/library/x509.d ./Encyrption/mbedtls/library/x509.o ./Encyrption/mbedtls/library/x509.su ./Encyrption/mbedtls/library/x509_create.cyclo ./Encyrption/mbedtls/library/x509_create.d ./Encyrption/mbedtls/library/x509_create.o ./Encyrption/mbedtls/library/x509_create.su ./Encyrption/mbedtls/library/x509_crl.cyclo ./Encyrption/mbedtls/library/x509_crl.d ./Encyrption/mbedtls/library/x509_crl.o ./Encyrption/mbedtls/library/x509_crl.su ./Encyrption/mbedtls/library/x509_crt.cyclo ./Encyrption/mbedtls/library/x509_crt.d ./Encyrption/mbedtls/library/x509_crt.o ./Encyrption/mbedtls/library/x509_crt.su ./Encyrption/mbedtls/library/x509_csr.cyclo ./Encyrption/mbedtls/library/x509_csr.d ./Encyrption/mbedtls/library/x509_csr.o ./Encyrption/mbedtls/library/x509_csr.su ./Encyrption/mbedtls/library/x509write.cyclo ./Encyrption/mbedtls/library/x509write.d ./Encyrption/mbedtls/library/x509write.o ./Encyrption/mbedtls/library/x509write.su ./Encyrption/mbedtls/library/x509write_crt.cyclo ./Encyrption/mbedtls/library/x509write_crt.d ./Encyrption/mbedtls/library/x509write_crt.o ./Encyrption/mbedtls/library/x509write_crt.su ./Encyrption/mbedtls/library/x509write_csr.cyclo ./Encyrption/mbedtls/library/x509write_csr.d ./Encyrption/mbedtls/library/x509write_csr.o ./Encyrption/mbedtls/library/x509write_csr.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-library

