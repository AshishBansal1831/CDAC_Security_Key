################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/mbedtls/tests/src/asn1_helpers.c \
../Encyrption/mbedtls/tests/src/bignum_helpers.c \
../Encyrption/mbedtls/tests/src/certs.c \
../Encyrption/mbedtls/tests/src/fake_external_rng_for_test.c \
../Encyrption/mbedtls/tests/src/helpers.c \
../Encyrption/mbedtls/tests/src/psa_crypto_helpers.c \
../Encyrption/mbedtls/tests/src/psa_crypto_stubs.c \
../Encyrption/mbedtls/tests/src/psa_exercise_key.c \
../Encyrption/mbedtls/tests/src/psa_memory_poisoning_wrappers.c \
../Encyrption/mbedtls/tests/src/psa_test_wrappers.c \
../Encyrption/mbedtls/tests/src/random.c \
../Encyrption/mbedtls/tests/src/test_memory.c \
../Encyrption/mbedtls/tests/src/threading_helpers.c 

C_DEPS += \
./Encyrption/mbedtls/tests/src/asn1_helpers.d \
./Encyrption/mbedtls/tests/src/bignum_helpers.d \
./Encyrption/mbedtls/tests/src/certs.d \
./Encyrption/mbedtls/tests/src/fake_external_rng_for_test.d \
./Encyrption/mbedtls/tests/src/helpers.d \
./Encyrption/mbedtls/tests/src/psa_crypto_helpers.d \
./Encyrption/mbedtls/tests/src/psa_crypto_stubs.d \
./Encyrption/mbedtls/tests/src/psa_exercise_key.d \
./Encyrption/mbedtls/tests/src/psa_memory_poisoning_wrappers.d \
./Encyrption/mbedtls/tests/src/psa_test_wrappers.d \
./Encyrption/mbedtls/tests/src/random.d \
./Encyrption/mbedtls/tests/src/test_memory.d \
./Encyrption/mbedtls/tests/src/threading_helpers.d 

OBJS += \
./Encyrption/mbedtls/tests/src/asn1_helpers.o \
./Encyrption/mbedtls/tests/src/bignum_helpers.o \
./Encyrption/mbedtls/tests/src/certs.o \
./Encyrption/mbedtls/tests/src/fake_external_rng_for_test.o \
./Encyrption/mbedtls/tests/src/helpers.o \
./Encyrption/mbedtls/tests/src/psa_crypto_helpers.o \
./Encyrption/mbedtls/tests/src/psa_crypto_stubs.o \
./Encyrption/mbedtls/tests/src/psa_exercise_key.o \
./Encyrption/mbedtls/tests/src/psa_memory_poisoning_wrappers.o \
./Encyrption/mbedtls/tests/src/psa_test_wrappers.o \
./Encyrption/mbedtls/tests/src/random.o \
./Encyrption/mbedtls/tests/src/test_memory.o \
./Encyrption/mbedtls/tests/src/threading_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/mbedtls/tests/src/%.o Encyrption/mbedtls/tests/src/%.su Encyrption/mbedtls/tests/src/%.cyclo: ../Encyrption/mbedtls/tests/src/%.c Encyrption/mbedtls/tests/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/core" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/library" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/include" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/mbedtls/tf-psa-crypto/drivers/builtin/include" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-mbedtls-2f-tests-2f-src

clean-Encyrption-2f-mbedtls-2f-tests-2f-src:
	-$(RM) ./Encyrption/mbedtls/tests/src/asn1_helpers.cyclo ./Encyrption/mbedtls/tests/src/asn1_helpers.d ./Encyrption/mbedtls/tests/src/asn1_helpers.o ./Encyrption/mbedtls/tests/src/asn1_helpers.su ./Encyrption/mbedtls/tests/src/bignum_helpers.cyclo ./Encyrption/mbedtls/tests/src/bignum_helpers.d ./Encyrption/mbedtls/tests/src/bignum_helpers.o ./Encyrption/mbedtls/tests/src/bignum_helpers.su ./Encyrption/mbedtls/tests/src/certs.cyclo ./Encyrption/mbedtls/tests/src/certs.d ./Encyrption/mbedtls/tests/src/certs.o ./Encyrption/mbedtls/tests/src/certs.su ./Encyrption/mbedtls/tests/src/fake_external_rng_for_test.cyclo ./Encyrption/mbedtls/tests/src/fake_external_rng_for_test.d ./Encyrption/mbedtls/tests/src/fake_external_rng_for_test.o ./Encyrption/mbedtls/tests/src/fake_external_rng_for_test.su ./Encyrption/mbedtls/tests/src/helpers.cyclo ./Encyrption/mbedtls/tests/src/helpers.d ./Encyrption/mbedtls/tests/src/helpers.o ./Encyrption/mbedtls/tests/src/helpers.su ./Encyrption/mbedtls/tests/src/psa_crypto_helpers.cyclo ./Encyrption/mbedtls/tests/src/psa_crypto_helpers.d ./Encyrption/mbedtls/tests/src/psa_crypto_helpers.o ./Encyrption/mbedtls/tests/src/psa_crypto_helpers.su ./Encyrption/mbedtls/tests/src/psa_crypto_stubs.cyclo ./Encyrption/mbedtls/tests/src/psa_crypto_stubs.d ./Encyrption/mbedtls/tests/src/psa_crypto_stubs.o ./Encyrption/mbedtls/tests/src/psa_crypto_stubs.su ./Encyrption/mbedtls/tests/src/psa_exercise_key.cyclo ./Encyrption/mbedtls/tests/src/psa_exercise_key.d ./Encyrption/mbedtls/tests/src/psa_exercise_key.o ./Encyrption/mbedtls/tests/src/psa_exercise_key.su ./Encyrption/mbedtls/tests/src/psa_memory_poisoning_wrappers.cyclo ./Encyrption/mbedtls/tests/src/psa_memory_poisoning_wrappers.d ./Encyrption/mbedtls/tests/src/psa_memory_poisoning_wrappers.o ./Encyrption/mbedtls/tests/src/psa_memory_poisoning_wrappers.su ./Encyrption/mbedtls/tests/src/psa_test_wrappers.cyclo ./Encyrption/mbedtls/tests/src/psa_test_wrappers.d ./Encyrption/mbedtls/tests/src/psa_test_wrappers.o ./Encyrption/mbedtls/tests/src/psa_test_wrappers.su ./Encyrption/mbedtls/tests/src/random.cyclo ./Encyrption/mbedtls/tests/src/random.d ./Encyrption/mbedtls/tests/src/random.o ./Encyrption/mbedtls/tests/src/random.su ./Encyrption/mbedtls/tests/src/test_memory.cyclo ./Encyrption/mbedtls/tests/src/test_memory.d ./Encyrption/mbedtls/tests/src/test_memory.o ./Encyrption/mbedtls/tests/src/test_memory.su ./Encyrption/mbedtls/tests/src/threading_helpers.cyclo ./Encyrption/mbedtls/tests/src/threading_helpers.d ./Encyrption/mbedtls/tests/src/threading_helpers.o ./Encyrption/mbedtls/tests/src/threading_helpers.su

.PHONY: clean-Encyrption-2f-mbedtls-2f-tests-2f-src

