################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/tinycrypt/tests/test_aes.c \
../Encyrption/tinycrypt/tests/test_cbc_mode.c \
../Encyrption/tinycrypt/tests/test_ccm_mode.c \
../Encyrption/tinycrypt/tests/test_cmac_mode.c \
../Encyrption/tinycrypt/tests/test_ctr_mode.c \
../Encyrption/tinycrypt/tests/test_ctr_prng.c \
../Encyrption/tinycrypt/tests/test_ecc_dh.c \
../Encyrption/tinycrypt/tests/test_ecc_dsa.c \
../Encyrption/tinycrypt/tests/test_ecc_utils.c \
../Encyrption/tinycrypt/tests/test_hmac.c \
../Encyrption/tinycrypt/tests/test_hmac_prng.c \
../Encyrption/tinycrypt/tests/test_sha256.c 

C_DEPS += \
./Encyrption/tinycrypt/tests/test_aes.d \
./Encyrption/tinycrypt/tests/test_cbc_mode.d \
./Encyrption/tinycrypt/tests/test_ccm_mode.d \
./Encyrption/tinycrypt/tests/test_cmac_mode.d \
./Encyrption/tinycrypt/tests/test_ctr_mode.d \
./Encyrption/tinycrypt/tests/test_ctr_prng.d \
./Encyrption/tinycrypt/tests/test_ecc_dh.d \
./Encyrption/tinycrypt/tests/test_ecc_dsa.d \
./Encyrption/tinycrypt/tests/test_ecc_utils.d \
./Encyrption/tinycrypt/tests/test_hmac.d \
./Encyrption/tinycrypt/tests/test_hmac_prng.d \
./Encyrption/tinycrypt/tests/test_sha256.d 

OBJS += \
./Encyrption/tinycrypt/tests/test_aes.o \
./Encyrption/tinycrypt/tests/test_cbc_mode.o \
./Encyrption/tinycrypt/tests/test_ccm_mode.o \
./Encyrption/tinycrypt/tests/test_cmac_mode.o \
./Encyrption/tinycrypt/tests/test_ctr_mode.o \
./Encyrption/tinycrypt/tests/test_ctr_prng.o \
./Encyrption/tinycrypt/tests/test_ecc_dh.o \
./Encyrption/tinycrypt/tests/test_ecc_dsa.o \
./Encyrption/tinycrypt/tests/test_ecc_utils.o \
./Encyrption/tinycrypt/tests/test_hmac.o \
./Encyrption/tinycrypt/tests/test_hmac_prng.o \
./Encyrption/tinycrypt/tests/test_sha256.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/tinycrypt/tests/%.o Encyrption/tinycrypt/tests/%.su Encyrption/tinycrypt/tests/%.cyclo: ../Encyrption/tinycrypt/tests/%.c Encyrption/tinycrypt/tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/wolfssl" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-tinycrypt-2f-tests

clean-Encyrption-2f-tinycrypt-2f-tests:
	-$(RM) ./Encyrption/tinycrypt/tests/test_aes.cyclo ./Encyrption/tinycrypt/tests/test_aes.d ./Encyrption/tinycrypt/tests/test_aes.o ./Encyrption/tinycrypt/tests/test_aes.su ./Encyrption/tinycrypt/tests/test_cbc_mode.cyclo ./Encyrption/tinycrypt/tests/test_cbc_mode.d ./Encyrption/tinycrypt/tests/test_cbc_mode.o ./Encyrption/tinycrypt/tests/test_cbc_mode.su ./Encyrption/tinycrypt/tests/test_ccm_mode.cyclo ./Encyrption/tinycrypt/tests/test_ccm_mode.d ./Encyrption/tinycrypt/tests/test_ccm_mode.o ./Encyrption/tinycrypt/tests/test_ccm_mode.su ./Encyrption/tinycrypt/tests/test_cmac_mode.cyclo ./Encyrption/tinycrypt/tests/test_cmac_mode.d ./Encyrption/tinycrypt/tests/test_cmac_mode.o ./Encyrption/tinycrypt/tests/test_cmac_mode.su ./Encyrption/tinycrypt/tests/test_ctr_mode.cyclo ./Encyrption/tinycrypt/tests/test_ctr_mode.d ./Encyrption/tinycrypt/tests/test_ctr_mode.o ./Encyrption/tinycrypt/tests/test_ctr_mode.su ./Encyrption/tinycrypt/tests/test_ctr_prng.cyclo ./Encyrption/tinycrypt/tests/test_ctr_prng.d ./Encyrption/tinycrypt/tests/test_ctr_prng.o ./Encyrption/tinycrypt/tests/test_ctr_prng.su ./Encyrption/tinycrypt/tests/test_ecc_dh.cyclo ./Encyrption/tinycrypt/tests/test_ecc_dh.d ./Encyrption/tinycrypt/tests/test_ecc_dh.o ./Encyrption/tinycrypt/tests/test_ecc_dh.su ./Encyrption/tinycrypt/tests/test_ecc_dsa.cyclo ./Encyrption/tinycrypt/tests/test_ecc_dsa.d ./Encyrption/tinycrypt/tests/test_ecc_dsa.o ./Encyrption/tinycrypt/tests/test_ecc_dsa.su ./Encyrption/tinycrypt/tests/test_ecc_utils.cyclo ./Encyrption/tinycrypt/tests/test_ecc_utils.d ./Encyrption/tinycrypt/tests/test_ecc_utils.o ./Encyrption/tinycrypt/tests/test_ecc_utils.su ./Encyrption/tinycrypt/tests/test_hmac.cyclo ./Encyrption/tinycrypt/tests/test_hmac.d ./Encyrption/tinycrypt/tests/test_hmac.o ./Encyrption/tinycrypt/tests/test_hmac.su ./Encyrption/tinycrypt/tests/test_hmac_prng.cyclo ./Encyrption/tinycrypt/tests/test_hmac_prng.d ./Encyrption/tinycrypt/tests/test_hmac_prng.o ./Encyrption/tinycrypt/tests/test_hmac_prng.su ./Encyrption/tinycrypt/tests/test_sha256.cyclo ./Encyrption/tinycrypt/tests/test_sha256.d ./Encyrption/tinycrypt/tests/test_sha256.o ./Encyrption/tinycrypt/tests/test_sha256.su

.PHONY: clean-Encyrption-2f-tinycrypt-2f-tests

