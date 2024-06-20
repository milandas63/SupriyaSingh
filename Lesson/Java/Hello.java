
public class Hello {
	public static void main(String[] args) {
		System.out.println("Hello World!");
		System.out.println("1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20");
		for(int i=1; i<=20; i++) {
			System.out.print(i+" ");
		}
		
		System.out.println();
		for(int i=0; i<=100; i+=5) {
			System.out.print(i+" ");
		}
		
		System.out.println();
		int seed = 1;
		for(int i=0; i<10; i++) {
			System.out.print(seed+" ");
			if(i%2==0) {
				seed = seed*2+1;
			} else {
				seed = seed*2-1;
			}
		}
		
		System.out.println();
		int spaces = 25;
		int stars = 1;
		for(int i=0; i<9; i++) {
			for(int j=0; j<spaces; j++) {
				System.out.print(" ");
			}
			for(int j=0; j<stars; j++) {
				System.out.print("*");
			}
			
			System.out.println();
			spaces--; stars+=2;
		}
	}
}
