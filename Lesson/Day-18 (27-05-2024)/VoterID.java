package com.exception;

public class VoterID {

	public static void main(String[] args) {
		int[] ages = {27,13,44,51,62,29,0,33,57,45,91,20,35,72,-36,61,24};
		for(int i=0; i<ages.length; i++) {
			try {
				checkAge(ages[i]);
				System.out.println(ages[i] + " is a valid age");
			} catch(TooYoungAgeException e) {
				System.out.println(ages[i] + " is too young age");
			} catch(TooOldAgeException e) {
				System.out.println(ages[i] + " is too old age");
			} catch(NegativeAgeException e) {
				System.out.println(ages[i] + " is negative age");
			} catch(ZeroAgeException e) {
				System.out.println(ages[i] + " is zero age");
			}
		}
	}
	
	public static void checkAge(int age) throws TooYoungAgeException,
												TooOldAgeException,
												NegativeAgeException,
												ZeroAgeException {
		if(age<0) throw new NegativeAgeException();
		else if(age==0) throw new ZeroAgeException();
		else if(age<18) throw new TooYoungAgeException();
		else if(age>90) throw new TooOldAgeException();
	}
}
