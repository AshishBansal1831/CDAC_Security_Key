################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/ssl/dtls_client.c \
../Encyrption/mbedtls/programs/ssl/dtls_server.c \
../Encyrption/mbedtls/programs/ssl/mini_client.c \
../Encyrption/mbedtls/programs/ssl/ssl_client1.c \
../Encyrption/mbedtls/programs/ssl/ssl_client2.c \
../Encyrption/mbedtls/programs/ssl/ssl_context_info.c \
../Encyrption/mbedtls/programs/ssl/ssl_fork_server.c \
../Encyrption/mbedtls/programs/ssl/ssl_mail_client.c \
../Encyrption/mbedtls/programs/ssl/ssl_pthread_server.c \
../Encyrption/mbedtls/programs/ssl/ssl_server.c \
../Encyrption/mbedtls/programs/ssl/ssl_server2.c \
../Encyrption/mbedtls/programs/ssl/ssl_test_common_source.c \
../Encyrption/mbedtls/programs/ssl/ssl_test_lib.c 

C_DEPS += \
./Encyrption/mbedtls/programs/ssl/dtls_client.d \
./Encyrption/mbedtls/programs/ssl/dtls_server.d \
./Encyrption/mbedtls/programs/ssl/mini_client.d \
./Encyrption/mbedtls/programs/ssl/ssl_client1.d \
./Encyrption/mbedtls/programs/ssl/ssl_client2.d \
./Encyrption/mbedtls/programs/ssl/ssl_context_info.d \
./Encyrption/mbedtls/programs/ssl/ssl_fork_server.d \
./Encyrption/mbedtls/programs/ssl/ssl_mail_client.d \
./Encyrption/mbedtls/programs/ssl/ssl_pthread_server.d \
./Encyrption/mbedtls/programs/ssl/ssl_server.d \
./Encyrption/mbedtls/programs/ssl/ssl_server2.d \
./Encyrption/mbedtls/programs/ssl/ssl_test_common_source.d \
./Encyrption/mbedtls/programs/ssl/ssl_test_lib.d 

OBJS += \
./Encyrption/mbedtls/programs/ssl/dtls_client.o \
./Encyrption/mbedtls/programs/ssl/dtls_server.o \
./Encyrption/mbedtls/programs/ssl/mini_client.o \
./Encyrption/mbedtls/programs/ssl/ssl_client1.o \
./Encyrption/mbedtls/programs/ssl/ssl_client2.o \
./Encyrption/mbedtls/programs/ssl/ssl_context_info.o \
./Encyrption/mbedtls/programs/ssl/ssl_fork_server.o \
./Encyrption/mbedtls/programs/ssl/ssl_mail_client.o \
./Encyrption/mbedtls/programs/ssl/ssl_pthread_server.o \
./Encyrption/mbedtls/programs/ssl/ssl_server.o \
./Encyrption/mbedtls/programs/ssl/ssl_server2.o \
./Encyrption/mbedtls/programs/ssl/ssl_test_common_source.o \
./Encyrption/mbedtls/programs/ssl/ssl_test_lib.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/ssl/%.o Encyrption/mbedtls/programs/ssl/%.su Encyrption/mbedtls/programs/ssl/%.cyclo: ../Encyrption/mbedtls/programs/ssl/%.c Encyrption/mbedtls/programs/ssl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-ssl

clean-Encyrption-2f-mbedtls-2f-programs-2f-ssl:
	-$(RM) ./Encyrption/mbedtls/programs/ssl/dtls_client.cyclo ./Encyrption/mbedtls/programs/ssl/dtls_client.d ./Encyrption/mbedtls/programs/ssl/dtls_client.o ./Encyrption/mbedtls/programs/ssl/dtls_client.su ./Encyrption/mbedtls/programs/ssl/dtls_server.cyclo ./Encyrption/mbedtls/programs/ssl/dtls_server.d ./Encyrption/mbedtls/programs/ssl/dtls_server.o ./Encyrption/mbedtls/programs/ssl/dtls_server.su ./Encyrption/mbedtls/programs/ssl/mini_client.cyclo ./Encyrption/mbedtls/programs/ssl/mini_client.d ./Encyrption/mbedtls/programs/ssl/mini_client.o ./Encyrption/mbedtls/programs/ssl/mini_client.su ./Encyrption/mbedtls/programs/ssl/ssl_client1.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_client1.d ./Encyrption/mbedtls/programs/ssl/ssl_client1.o ./Encyrption/mbedtls/programs/ssl/ssl_client1.su ./Encyrption/mbedtls/programs/ssl/ssl_client2.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_client2.d ./Encyrption/mbedtls/programs/ssl/ssl_client2.o ./Encyrption/mbedtls/programs/ssl/ssl_client2.su ./Encyrption/mbedtls/programs/ssl/ssl_context_info.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_context_info.d ./Encyrption/mbedtls/programs/ssl/ssl_context_info.o ./Encyrption/mbedtls/programs/ssl/ssl_context_info.su ./Encyrption/mbedtls/programs/ssl/ssl_fork_server.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_fork_server.d ./Encyrption/mbedtls/programs/ssl/ssl_fork_server.o ./Encyrption/mbedtls/programs/ssl/ssl_fork_server.su ./Encyrption/mbedtls/programs/ssl/ssl_mail_client.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_mail_client.d ./Encyrption/mbedtls/programs/ssl/ssl_mail_client.o ./Encyrption/mbedtls/programs/ssl/ssl_mail_client.su ./Encyrption/mbedtls/programs/ssl/ssl_pthread_server.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_pthread_server.d ./Encyrption/mbedtls/programs/ssl/ssl_pthread_server.o ./Encyrption/mbedtls/programs/ssl/ssl_pthread_server.su ./Encyrption/mbedtls/programs/ssl/ssl_server.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_server.d ./Encyrption/mbedtls/programs/ssl/ssl_server.o ./Encyrption/mbedtls/programs/ssl/ssl_server.su ./Encyrption/mbedtls/programs/ssl/ssl_server2.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_server2.d ./Encyrption/mbedtls/programs/ssl/ssl_server2.o ./Encyrption/mbedtls/programs/ssl/ssl_server2.su ./Encyrption/mbedtls/programs/ssl/ssl_test_common_source.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_test_common_source.d ./Encyrption/mbedtls/programs/ssl/ssl_test_common_source.o ./Encyrption/mbedtls/programs/ssl/ssl_test_common_source.su ./Encyrption/mbedtls/programs/ssl/ssl_test_lib.cyclo ./Encyrption/mbedtls/programs/ssl/ssl_test_lib.d ./Encyrption/mbedtls/programs/ssl/ssl_test_lib.o ./Encyrption/mbedtls/programs/ssl/ssl_test_lib.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-ssl

