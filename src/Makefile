BUILD:=../build
SRC:=.

ENTRYPOINT:= 0x10000

CFLAGS:= -m32 					# 32 λ�ĳ���
# CFLAGS+= -march=pentium			# pentium ������
CFLAGS+= -fno-builtin			# ����Ҫ gcc ���ú���
CFLAGS+= -nostdinc				# ����Ҫ��׼ͷ�ļ�
CFLAGS+= -fno-pic				# ����Ҫλ���޹صĴ���  position independent code
CFLAGS+= -fno-pie				# ����Ҫλ���޹صĿ�ִ�г��� position independent executable
CFLAGS+= -nostdlib				# ����Ҫ��׼��
CFLAGS+= -fno-stack-protector	# ����Ҫջ����
# CFLAGS+= -Werror
# CFLAGS+= -DONIX					# ���� ONIX
# CFLAGS+= -DONIX_DEBUG			# ���� ONIX_DEBUG
CFLAGS:=$(strip ${CFLAGS})

DEBUG:= -g
INCLUDE:=-I$(SRC)/include

$(BUILD)/boot/%.bin: $(SRC)/boot/%.asm
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.asm
	$(shell mkdir -p $(dir $@))
	nasm -f elf32 $(DEBUG) $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.c
	$(shell mkdir -p $(dir $@))
	gcc $(CFLAGS) $(DEBUG) $(INCLUDE) -c $< -o $@

$(BUILD)/kernel.bin: $(BUILD)/kernel/start.o \
	$(BUILD)/kernel/main.o 

	$(shell mkdir -p $(dir $@))
	ld -m elf_i386 -static $^ -o $@ -Ttext $(ENTRYPOINT)

$(BUILD)/system.bin: $(BUILD)/kernel.bin
	objcopy -O binary $< $@

$(BUILD)/system.map: $(BUILD)/kernel.bin
	nm $< | sort > $@

$(BUILD)/master.img: $(BUILD)/boot/boot.bin \
	$(BUILD)/boot/loader.bin \
	$(BUILD)/system.bin \
	$(BUILD)/system.map \

	yes | bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD)/boot/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc
	dd if=$(BUILD)/system.bin of=$@ bs=512 count=200 seek=10 conv=notrunc

test: $(BUILD)/master.img

.PHONY: clean
clean:
	rm -rf $(BUILD)
	
.PHONY: bochs
bochs: $(BUILD)/master.img
	bochs -q