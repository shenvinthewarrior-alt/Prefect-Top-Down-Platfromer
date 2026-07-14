enum Action
{
    GO_UP,
    GO_DOWN,
    GO_LEFT,
    GO_RIGHT,
	JUMP,
	RUN,
	CROSS_PUNCH
}

key = [];
key[Action.GO_UP] = ord("W");
key[Action.GO_DOWN] = ord("S");
key[Action.GO_LEFT] = ord("A");
key[Action.GO_RIGHT] = ord("D");
key[Action.JUMP] = vk_space;
key[Action.RUN] = vk_shift;
key[Action.CROSS_PUNCH] = ord("L");

binding = -1;
state = 0;