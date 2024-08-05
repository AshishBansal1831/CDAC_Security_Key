################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/programs/test/benchmark.c \
../Encyrption/mbedtls/programs/test/dlopen.c \
../Encyrption/mbedtls/programs/test/metatest.c \
../Encyrption/mbedtls/programs/test/query_compile_time_config.c \
../Encyrption/mbedtls/programs/test/query_included_headers.c \
../Encyrption/mbedtls/programs/test/selftest.c \
../Encyrption/mbedtls/programs/test/udp_proxy.c \
../Encyrption/mbedtls/programs/test/zeroize.c 

C_DEPS += \
./Encyrption/mbedtls/programs/test/benchmark.d \
./Encyrption/mbedtls/programs/test/dlopen.d \
./Encyrption/mbedtls/programs/test/metatest.d \
./Encyrption/mbedtls/programs/test/query_compile_time_config.d \
./Encyrption/mbedtls/programs/test/query_included_headers.d \
./Encyrption/mbedtls/programs/test/selftest.d \
./Encyrption/mbedtls/programs/test/udp_proxy.d \
./Encyrption/mbedtls/programs/test/zeroize.d 

OBJS += \
./Encyrption/mbedtls/programs/test/benchmark.o \
./Encyrption/mbedtls/programs/test/dlopen.o \
./Encyrption/mbedtls/programs/test/metatest.o \
./Encyrption/mbedtls/programs/test/query_compile_time_config.o \
./Encyrption/mbedtls/programs/test/query_included_headers.o \
./Encyrption/mbedtls/programs/test/selftest.o \
./Encyrption/mbedtls/programs/test/udp_proxy.o \
./Encyrption/mbedtls/programs/test/zeroize.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/programs/test/%.o Encyrption/mbedtls/programs/test/%.su Encyrption/mbedtls/programs/test/%.cyclo: ../Encyrption/mbedtls/programs/test/%.c Encyrption/mbedtls/programs/test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-programs-2f-test

clean-Encyrption-2f-mbedtls-2f-programs-2f-test:
	-$(RM) ./Encyrption/mbedtls/programs/test/benchmark.cyclo ./Encyrption/mbedtls/programs/test/benchmark.d ./Encyrption/mbedtls/programs/test/benchmark.o ./Encyrption/mbedtls/programs/test/benchmark.su ./Encyrption/mbedtls/programs/test/dlopen.cyclo ./Encyrption/mbedtls/programs/test/dlopen.d ./Encyrption/mbedtls/programs/test/dlopen.o ./Encyrption/mbedtls/programs/test/dlopen.su ./Encyrption/mbedtls/programs/test/metatest.cyclo ./Encyrption/mbedtls/programs/test/metatest.d ./Encyrption/mbedtls/programs/test/metatest.o ./Encyrption/mbedtls/programs/test/metatest.su ./Encyrption/mbedtls/programs/test/query_compile_time_config.cyclo ./Encyrption/mbedtls/programs/test/query_compile_time_config.d ./Encyrption/mbedtls/programs/test/query_compile_time_config.o ./Encyrption/mbedtls/programs/test/query_compile_time_config.su ./Encyrption/mbedtls/programs/test/query_included_headers.cyclo ./Encyrption/mbedtls/programs/test/query_included_headers.d ./Encyrption/mbedtls/programs/test/query_included_headers.o ./Encyrption/mbedtls/programs/test/query_included_headers.su ./Encyrption/mbedtls/programs/test/selftest.cyclo ./Encyrption/mbedtls/programs/test/selftest.d ./Encyrption/mbedtls/programs/test/selftest.o ./Encyrption/mbedtls/programs/test/selftest.su ./Encyrption/mbedtls/programs/test/udp_proxy.cyclo ./Encyrption/mbedtls/programs/test/udp_proxy.d ./Encyrption/mbedtls/programs/test/udp_proxy.o ./Encyrption/mbedtls/programs/test/udp_proxy.su ./Encyrption/mbedtls/programs/test/zeroize.cyclo ./Encyrption/mbedtls/programs/test/zeroize.d ./Encyrption/mbedtls/programs/test/zeroize.o ./Encyrption/mbedtls/programs/test/zeroize.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-programs-2f-test

