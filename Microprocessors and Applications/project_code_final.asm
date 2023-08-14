.global _start
_start:
	
ldr r10, =0x1FFFF100 //make a base address to store user preferences

//set registers value to 1/0 in order to choose or not
movs r0,#0 // french 
movs r1,#0 // frappe
movs r2,#1 // nescafe
movs r3,#0 // espresso

movs r4,#0 // no sugar
movs r5,#1 // mid sugar level
movs r6,#0 // high sugar level

movs r7,#1 // milk
movs r8,#0 // cinnamon
movs r9,#1 // mix

//check if user insert more than one type of coffee
movs r11,#0
adds r11,r0,r1
adds r11,r11,r2
adds r11,r11,r3
cmp r11,#1
bhi funcstop

//check if user insert more than one type of sugar
movs r11,#0
adds r11,r4,r5
adds r11,r11,r6
cmp r11,#1
bhi funcstop

// detect the coffee type and store it in memory 0x1FFFF104
// store 0 if french coffee selected
// store 1 if frappe coffee selected
// store 2 if nescafe coffee selected
// store 3 if espresso coffee selected

cmp r0,#1
bne nextcoffee1
movs r11,#0 // 0 ---> french coffee in memory
str r11,[r10,#4]
b sugar

nextcoffee1:

cmp r1,#1
bne nextcoffee2
movs r11,#1 // 1 ---> frappe coffee in memory
str r11,[r10,#4]
b sugar

nextcoffee2:

cmp r2,#1
bne nextcoffee3
movs r11,#2 // 2 ---> nescafe coffee in memory
str r11,[r10,#4]
b sugar

nextcoffee3:

cmp r3,#1
bne sugar
movs r11,#3 // 3 ---> espresso coffee in memory
str r11,[r10,#4]

sugar:

// Define sugar level and store it in memory 0x1FFFF108
// store 0 if no sugar selected
// store 1 if mid level sugar selected
// store 2 if high level sugar selected

cmp r4,#1
bne nextsugar1
movs r11,#0 // 0 ---> zero sugar in memory
str r11,[r10,#8]
b extras

nextsugar1:

cmp r5,#1
bne nextsugar2
movs r11,#1 // 1 ---> mid sugar level in memory
str r11,[r10,#8]
b extras

nextsugar2:

cmp r6,#1
bne extras
movs r11,#2 // 2 ---> high sugar level in memory
str r11,[r10,#8]

extras:

//Milk,Cinnamon,mix

//Define if user wants milk and store it in memory 0x1FFFF10C
cmp r7,#1
bne nomilk
movs r11,#1 // 1 ---> milk  in memory if choosen
str r11,[r10,#12]

b nextchoice1

nomilk:
movs r11,#0 // 0 ---> milk  in memory if not choosen
str r11,[r10,#12]

nextchoice1:

//Define if user wants cinnamon and store it in memory 0x1FFFF110
cmp r8,#1
bne nocinnamon
movs r11,#1 // 1 ---> cinnamon in memory if choosen
str r11,[r10,#16]

b nextchoice2

nocinnamon:
movs r11,#0 // 0 ---> cinnamon in memory if not choosen
str r11,[r10,#16]

nextchoice2: 

//Define if user wants to mix the coffee and store it in memory 0x1FFFF114
cmp r9,#1
bne nomix
movs r11,#1 // 1 ---> mix in memory if choosen
str r11,[r10,#20]

b funcstop

nomix:
movs r11,#0 // 0 ---> mix in memory if not choosen
str r11,[r10,#20]

funcstop:

bx lr