################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/library/debug.c \
../Encyrption/library/mps_reader.c \
../Encyrption/library/mps_trace.c \
../Encyrption/library/net_sockets.c \
../Encyrption/library/pkcs7.c \
../Encyrption/library/ssl_cache.c \
../Encyrption/library/ssl_ciphersuites.c \
../Encyrption/library/ssl_client.c \
../Encyrption/library/ssl_cookie.c \
../Encyrption/library/ssl_msg.c \
../Encyrption/library/ssl_ticket.c \
../Encyrption/library/ssl_tls.c \
../Encyrption/library/ssl_tls12_client.c \
../Encyrption/library/ssl_tls12_server.c \
../Encyrption/library/ssl_tls13_client.c \
../Encyrption/library/ssl_tls13_generic.c \
../Encyrption/library/ssl_tls13_keys.c \
../Encyrption/library/ssl_tls13_server.c \
../Encyrption/library/x509.c \
../Encyrption/library/x509_create.c \
../Encyrption/library/x509_crl.c \
../Encyrption/library/x509_crt.c \
../Encyrption/library/x509_csr.c \
../Encyrption/library/x509write.c \
../Encyrption/library/x509write_crt.c \
../Encyrption/library/x509write_csr.c 

C_DEPS += \
./Encyrption/library/debug.d \
./Encyrption/library/mps_reader.d \
./Encyrption/library/mps_trace.d \
./Encyrption/library/net_sockets.d \
./Encyrption/library/pkcs7.d \
./Encyrption/library/ssl_cache.d \
./Encyrption/library/ssl_ciphersuites.d \
./Encyrption/library/ssl_client.d \
./Encyrption/library/ssl_cookie.d \
./Encyrption/library/ssl_msg.d \
./Encyrption/library/ssl_ticket.d \
./Encyrption/library/ssl_tls.d \
./Encyrption/library/ssl_tls12_client.d \
./Encyrption/library/ssl_tls12_server.d \
./Encyrption/library/ssl_tls13_client.d \
./Encyrption/library/ssl_tls13_generic.d \
./Encyrption/library/ssl_tls13_keys.d \
./Encyrption/library/ssl_tls13_server.d \
./Encyrption/library/x509.d \
./Encyrption/library/x509_create.d \
./Encyrption/library/x509_crl.d \
./Encyrption/library/x509_crt.d \
./Encyrption/library/x509_csr.d \
./Encyrption/library/x509write.d \
./Encyrption/library/x509write_crt.d \
./Encyrption/library/x509write_csr.d 

OBJS += \
./Encyrption/library/debug.o \
./Encyrption/library/mps_reader.o \
./Encyrption/library/mps_trace.o \
./Encyrption/library/net_sockets.o \
./Encyrption/library/pkcs7.o \
./Encyrption/library/ssl_cache.o \
./Encyrption/library/ssl_ciphersuites.o \
./Encyrption/library/ssl_client.o \
./Encyrption/library/ssl_cookie.o \
./Encyrption/library/ssl_msg.o \
./Encyrption/library/ssl_ticket.o \
./Encyrption/library/ssl_tls.o \
./Encyrption/library/ssl_tls12_client.o \
./Encyrption/library/ssl_tls12_server.o \
./Encyrption/library/ssl_tls13_client.o \
./Encyrption/library/ssl_tls13_generic.o \
./Encyrption/library/ssl_tls13_keys.o \
./Encyrption/library/ssl_tls13_server.o \
./Encyrption/library/x509.o \
./Encyrption/library/x509_create.o \
./Encyrption/library/x509_crl.o \
./Encyrption/library/x509_crt.o \
./Encyrption/library/x509_csr.o \
./Encyrption/library/x509write.o \
./Encyrption/library/x509write_crt.o \
./Encyrption/library/x509write_csr.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/library/%.o Encyrption/library/%.su Encyrption/library/%.cyclo: ../Encyrption/library/%.c Encyrption/library/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/include" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-library

clean-Encyrption-2f-library:
	-$(RM) ./Encyrption/library/debug.cyclo ./Encyrption/library/debug.d ./Encyrption/library/debug.o ./Encyrption/library/debug.su ./Encyrption/library/mps_reader.cyclo ./Encyrption/library/mps_reader.d ./Encyrption/library/mps_reader.o ./Encyrption/library/mps_reader.su ./Encyrption/library/mps_trace.cyclo ./Encyrption/library/mps_trace.d ./Encyrption/library/mps_trace.o ./Encyrption/library/mps_trace.su ./Encyrption/library/net_sockets.cyclo ./Encyrption/library/net_sockets.d ./Encyrption/library/net_sockets.o ./Encyrption/library/net_sockets.su ./Encyrption/library/pkcs7.cyclo ./Encyrption/library/pkcs7.d ./Encyrption/library/pkcs7.o ./Encyrption/library/pkcs7.su ./Encyrption/library/ssl_cache.cyclo ./Encyrption/library/ssl_cache.d ./Encyrption/library/ssl_cache.o ./Encyrption/library/ssl_cache.su ./Encyrption/library/ssl_ciphersuites.cyclo ./Encyrption/library/ssl_ciphersuites.d ./Encyrption/library/ssl_ciphersuites.o ./Encyrption/library/ssl_ciphersuites.su ./Encyrption/library/ssl_client.cyclo ./Encyrption/library/ssl_client.d ./Encyrption/library/ssl_client.o ./Encyrption/library/ssl_client.su ./Encyrption/library/ssl_cookie.cyclo ./Encyrption/library/ssl_cookie.d ./Encyrption/library/ssl_cookie.o ./Encyrption/library/ssl_cookie.su ./Encyrption/library/ssl_msg.cyclo ./Encyrption/library/ssl_msg.d ./Encyrption/library/ssl_msg.o ./Encyrption/library/ssl_msg.su ./Encyrption/library/ssl_ticket.cyclo ./Encyrption/library/ssl_ticket.d ./Encyrption/library/ssl_ticket.o ./Encyrption/library/ssl_ticket.su ./Encyrption/library/ssl_tls.cyclo ./Encyrption/library/ssl_tls.d ./Encyrption/library/ssl_tls.o ./Encyrption/library/ssl_tls.su ./Encyrption/library/ssl_tls12_client.cyclo ./Encyrption/library/ssl_tls12_client.d ./Encyrption/library/ssl_tls12_client.o ./Encyrption/library/ssl_tls12_client.su ./Encyrption/library/ssl_tls12_server.cyclo ./Encyrption/library/ssl_tls12_server.d ./Encyrption/library/ssl_tls12_server.o ./Encyrption/library/ssl_tls12_server.su ./Encyrption/library/ssl_tls13_client.cyclo ./Encyrption/library/ssl_tls13_client.d ./Encyrption/library/ssl_tls13_client.o ./Encyrption/library/ssl_tls13_client.su ./Encyrption/library/ssl_tls13_generic.cyclo ./Encyrption/library/ssl_tls13_generic.d ./Encyrption/library/ssl_tls13_generic.o ./Encyrption/library/ssl_tls13_generic.su ./Encyrption/library/ssl_tls13_keys.cyclo ./Encyrption/library/ssl_tls13_keys.d ./Encyrption/library/ssl_tls13_keys.o ./Encyrption/library/ssl_tls13_keys.su ./Encyrption/library/ssl_tls13_server.cyclo ./Encyrption/library/ssl_tls13_server.d ./Encyrption/library/ssl_tls13_server.o ./Encyrption/library/ssl_tls13_server.su ./Encyrption/library/x509.cyclo ./Encyrption/library/x509.d ./Encyrption/library/x509.o ./Encyrption/library/x509.su ./Encyrption/library/x509_create.cyclo ./Encyrption/library/x509_create.d ./Encyrption/library/x509_create.o ./Encyrption/library/x509_create.su ./Encyrption/library/x509_crl.cyclo ./Encyrption/library/x509_crl.d ./Encyrption/library/x509_crl.o ./Encyrption/library/x509_crl.su ./Encyrption/library/x509_crt.cyclo ./Encyrption/library/x509_crt.d ./Encyrption/library/x509_crt.o ./Encyrption/library/x509_crt.su ./Encyrption/library/x509_csr.cyclo ./Encyrption/library/x509_csr.d ./Encyrption/library/x509_csr.o ./Encyrption/library/x509_csr.su ./Encyrption/library/x509write.cyclo ./Encyrption/library/x509write.d ./Encyrption/library/x509write.o ./Encyrption/library/x509write.su ./Encyrption/library/x509write_crt.cyclo ./Encyrption/library/x509write_crt.d ./Encyrption/library/x509write_crt.o ./Encyrption/library/x509write_crt.su ./Encyrption/library/x509write_csr.cyclo ./Encyrption/library/x509write_csr.d ./Encyrption/library/x509write_csr.o ./Encyrption/library/x509write_csr.su

.PHONY: clean-Encyrption-2f-library

