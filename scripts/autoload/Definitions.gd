extends Node

var is_player_busy = false

var OM_L1_1 : Dictionary = {
	"0" : {"name" : "DM", "text" : "Antes de Vadim encostar na porta, um suspiro cansado pode ser ouvido."},
	"1" : {"name" : "MC", "text" : "Hm?"},
	"2" : {"name" : "DM", "text" : "Toc, toc."},
	"3" : {"name" : "CH", "text" : "Já tentou falar com seus netos sobre isso?", "action" : "EXEC_DIALOG", "target" : "OM_L1_C1"},
	"4" : {"name" : "CH", "text" : "Já tentou falar com seus filhos sobre isso?", "action" : "EXEC_DIALOG", "target" : "OM_L1_C2"},
}

var OM_L1_C1 : Dictionary = {
	"0" : {"name" : "OM", "text" : "E o que iria acontecer? Eles ficariam com pena do pobre velhinho e iam começar a passar mais tempo comigo?"}
}

var OM_L1_C2 : Dictionary = {
	"0" : {"name" : "OM", "text" : "E o que eles iriam fazer? Forçar seus filhos a passar mais tempo com o avô pois ele se sentiu solitário?"}
}

var TestText2 : Dictionary = {
	"0" : {"name" : "DM", "text" : "Test Text 1."},
	"1" : {"name" : "DM", "text" : "Alalele"},
}

var DialogTable : Dictionary = {
	"OM_L1_0" : OM_L1_1,
	"OM_L1_C1" : OM_L1_C1,
	"OM_L1_C2" : OM_L1_C2,
	"OM_L1_1" : OM_L1_1,
	"TestText2" : TestText2
}
var temp = {
	"5" : {"name" : "MC", "text" : "Bom dia, Viyeniya."},
	"6" : {"name" : "OM", "text" : "Oh, Vadik! Bom dia, bom dia! É sempre bom te ver. Conseguiu dormir bem esta noite?"},
	"7" : {"name" : "MC", "text" : "Dormi, sim. Não costumo ter dificuldades para isso."},
	"8" : {"name" : "MC", "text" : "Mas você não soa tão contente para mim. Algo aconteceu? Posso lhe ajudar."},
	"9" : {"name" : "OM", "text" : "Bobeira, Vadik. Não se preocupe, não é nada importante, eu resolverei isso em breve."},
	"10" : {"name" : "MC", "text" : "Por favor, Viyeniya. Eu insisto. Quero te ver bem."},
	"11" : {"name" : "OM", "text" : "Mas... Oras, bem. Se você quer mesmo saber, Vadik, eu ando tendo alguns problemas familiares. Mas não pense em bobagem, são apenas algumas dificuldades com meus netos."},
	"12" : {"name" : "MC", "text" : "Não sabia que já tinha netos, Viyeniya."},
}
