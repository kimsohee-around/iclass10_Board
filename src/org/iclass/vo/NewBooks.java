package org.iclass.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NewBooks {
	private int idx;
	private String title;
	private String summary;
	private Timestamp regdate;
	private String coverfile;
	private String userid;

}
