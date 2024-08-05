################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Encyrption/tinycrypt/lib/source/aes_decrypt.c \
../Encyrption/tinycrypt/lib/source/aes_encrypt.c \
../Encyrption/tinycrypt/lib/source/cbc_mode.c \
../Encyrption/tinycrypt/lib/source/ccm_mode.c \
../Encyrption/tinycrypt/lib/source/cmac_mode.c \
../Encyrption/tinycrypt/lib/source/ctr_mode.c \
../Encyrption/tinycrypt/lib/source/ctr_prng.c \
../Encyrption/tinycrypt/lib/source/ecc.c \
../Encyrption/tinycrypt/lib/source/ecc_dh.c \
../Encyrption/tinycrypt/lib/source/ecc_dsa.c \
../Encyrption/tinycrypt/lib/source/ecc_platform_specific.c \
../Encyrption/tinycrypt/lib/source/hmac.c \
../Encyrption/tinycrypt/lib/source/hmac_prng.c \
../Encyrption/tinycrypt/lib/source/sha256.c \
../Encyrption/tinycrypt/lib/source/utils.c 

C_DEPS += \
./Encyrption/tinycrypt/lib/source/aes_decrypt.d \
./Encyrption/tinycrypt/lib/source/aes_encrypt.d \
./Encyrption/tinycrypt/lib/source/cbc_mode.d \
./Encyrption/tinycrypt/lib/source/ccm_mode.d \
./Encyrption/tinycrypt/lib/source/cmac_mode.d \
./Encyrption/tinycrypt/lib/source/ctr_mode.d \
./Encyrption/tinycrypt/lib/source/ctr_prng.d \
./Encyrption/tinycrypt/lib/source/ecc.d \
./Encyrption/tinycrypt/lib/source/ecc_dh.d \
./Encyrption/tinycrypt/lib/source/ecc_dsa.d \
./Encyrption/tinycrypt/lib/source/ecc_platform_specific.d \
./Encyrption/tinycrypt/lib/source/hmac.d \
./Encyrption/tinycrypt/lib/source/hmac_prng.d \
./Encyrption/tinycrypt/lib/source/sha256.d \
./Encyrption/tinycrypt/lib/source/utils.d 

OBJS += \
./Encyrption/tinycrypt/lib/source/aes_decrypt.o \
./Encyrption/tinycrypt/lib/source/aes_encrypt.o \
./Encyrption/tinycrypt/lib/source/cbc_mode.o \
./Encyrption/tinycrypt/lib/source/ccm_mode.o \
./Encyrption/tinycrypt/lib/source/cmac_mode.o \
./Encyrption/tinycrypt/lib/source/ctr_mode.o \
./Encyrption/tinycrypt/lib/source/ctr_prng.o \
./Encyrption/tinycrypt/lib/source/ecc.o \
./Encyrption/tinycrypt/lib/source/ecc_dh.o \
./Encyrption/tinycrypt/lib/source/ecc_dsa.o \
./Encyrption/tinycrypt/lib/source/ecc_platform_specific.o \
./Encyrption/tinycrypt/lib/source/hmac.o \
./Encyrption/tinycrypt/lib/source/hmac_prng.o \
./Encyrption/tinycrypt/lib/source/sha256.o \
./Encyrption/tinycrypt/lib/source/utils.o 


# Each subdirectory must supply rules for building sources it contributes
Encyrption/tinycrypt/lib/source/%.o Encyrption/tinycrypt/lib/source/%.su Encyrption/tinycrypt/lib/source/%.cyclo: ../Encyrption/tinycrypt/lib/source/%.c Encyrption/tinycrypt/lib/source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption/wolfssl" -I"D:/CDAC/CDAC-Project/Security Key Code/Encyrption" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CustomHID/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Encyrption-2f-tinycrypt-2f-lib-2f-source

clean-Encyrption-2f-tinycrypt-2f-lib-2f-source:
	-$(RM) ./Encyrption/tinycrypt/lib/source/aes_decrypt.cyclo ./Encyrption/tinycrypt/lib/source/aes_decrypt.d ./Encyrption/tinycrypt/lib/source/aes_decrypt.o ./Encyrption/tinycrypt/lib/source/aes_decrypt.su ./Encyrption/tinycrypt/lib/source/aes_encrypt.cyclo ./Encyrption/tinycrypt/lib/source/aes_encrypt.d ./Encyrption/tinycrypt/lib/source/aes_encrypt.o ./Encyrption/tinycrypt/lib/source/aes_encrypt.su ./Encyrption/tinycrypt/lib/source/cbc_mode.cyclo ./Encyrption/tinycrypt/lib/source/cbc_mode.d ./Encyrption/tinycrypt/lib/source/cbc_mode.o ./Encyrption/tinycrypt/lib/source/cbc_mode.su ./Encyrption/tinycrypt/lib/source/ccm_mode.cyclo ./Encyrption/tinycrypt/lib/source/ccm_mode.d ./Encyrption/tinycrypt/lib/source/ccm_mode.o ./Encyrption/tinycrypt/lib/source/ccm_mode.su ./Encyrption/tinycrypt/lib/source/cmac_mode.cyclo ./Encyrption/tinycrypt/lib/source/cmac_mode.d ./Encyrption/tinycrypt/lib/source/cmac_mode.o ./Encyrption/tinycrypt/lib/source/cmac_mode.su ./Encyrption/tinycrypt/lib/source/ctr_mode.cyclo ./Encyrption/tinycrypt/lib/source/ctr_mode.d ./Encyrption/tinycrypt/lib/source/ctr_mode.o ./Encyrption/tinycrypt/lib/source/ctr_mode.su ./Encyrption/tinycrypt/lib/source/ctr_prng.cyclo ./Encyrption/tinycrypt/lib/source/ctr_prng.d ./Encyrption/tinycrypt/lib/source/ctr_prng.o ./Encyrption/tinycrypt/lib/source/ctr_prng.su ./Encyrption/tinycrypt/lib/source/ecc.cyclo ./Encyrption/tinycrypt/lib/source/ecc.d ./Encyrption/tinycrypt/lib/source/ecc.o ./Encyrption/tinycrypt/lib/source/ecc.su ./Encyrption/tinycrypt/lib/source/ecc_dh.cyclo ./Encyrption/tinycrypt/lib/source/ecc_dh.d ./Encyrption/tinycrypt/lib/source/ecc_dh.o ./Encyrption/tinycrypt/lib/source/ecc_dh.su ./Encyrption/tinycrypt/lib/source/ecc_dsa.cyclo ./Encyrption/tinycrypt/lib/source/ecc_dsa.d ./Encyrption/tinycrypt/lib/source/ecc_dsa.o ./Encyrption/tinycrypt/lib/source/ecc_dsa.su ./Encyrption/tinycrypt/lib/source/ecc_platform_specific.cyclo ./Encyrption/tinycrypt/lib/source/ecc_platform_specific.d ./Encyrption/tinycrypt/lib/source/ecc_platform_specific.o ./Encyrption/tinycrypt/lib/source/ecc_platform_specific.su ./Encyrption/tinycrypt/lib/source/hmac.cyclo ./Encyrption/tinycrypt/lib/source/hmac.d ./Encyrption/tinycrypt/lib/source/hmac.o ./Encyrption/tinycrypt/lib/source/hmac.su ./Encyrption/tinycrypt/lib/source/hmac_prng.cyclo ./Encyrption/tinycrypt/lib/source/hmac_prng.d ./Encyrption/tinycrypt/lib/source/hmac_prng.o ./Encyrption/tinycrypt/lib/source/hmac_prng.su ./Encyrption/tinycrypt/lib/source/sha256.cyclo ./Encyrption/tinycrypt/lib/source/sha256.d ./Encyrption/tinycrypt/lib/source/sha256.o ./Encyrption/tinycrypt/lib/source/sha256.su ./Encyrption/tinycrypt/lib/source/utils.cyclo ./Encyrption/tinycrypt/lib/source/utils.d ./Encyrption/tinycrypt/lib/source/utils.o ./Encyrption/tinycrypt/lib/source/utils.su

.PHONY: clean-Encyrption-2f-tinycrypt-2f-lib-2f-source

