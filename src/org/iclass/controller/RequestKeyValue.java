package org.iclass.controller;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode			//필수
public class RequestKeyValue {
	private String url;		//servlet Path
	private String method;	//GET,POST
}
