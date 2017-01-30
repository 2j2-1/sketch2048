void keyPressed() {
	if (keyCode == 32) {
		float[][] gaming_board = new float[1][16];
		gaming_board[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
		float[][] x = nn.forward(gaming_board);
		switch(index(x[0],max(x[0]))){
			case 0:
			move(UP);
			break;
			case 1:
			move(DOWN);
			break;
			case 2:
			move(LEFT);
			break;
			case 3:
			move(RIGHT);
			break;}
    println();
    println(maxBoard());

    println();
}
else {
	move(keyCode);
}
}
