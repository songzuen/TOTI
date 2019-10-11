CREATE TABLE toti.toti_cate (
  cate_idx int(11) NOT NULL AUTO_INCREMENT,
  cate_name varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (cate_idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_estimatee (
  est_idx int(11) NOT NULL AUTO_INCREMENT,
  request_idx int(11) NOT NULL,
  mento_idx int(11) NOT NULL,
  est_price int(11) NOT NULL,
  est_cont varchar(500) COLLATE utf8_bin NOT NULL,
  est_file varchar(100) COLLATE utf8_bin DEFAULT 'NO FILE',
  est_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (est_idx),
  KEY FK_toti_mentor_TO_toti_estimatee (mento_idx),
  KEY FK_toti_request_TO_toti_estimatee (request_idx),
  CONSTRAINT FK_toti_mentor_TO_toti_estimatee FOREIGN KEY (mento_idx) REFERENCES toti_mentor (mento_idx) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_toti_request_TO_toti_estimatee FOREIGN KEY (request_idx) REFERENCES toti_request (request_idx) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_member (
  m_idx int(11) NOT NULL AUTO_INCREMENT,
  m_id varchar(16) COLLATE utf8_bin NOT NULL,
  m_pw varchar(16) COLLATE utf8_bin NOT NULL,
  m_name varchar(50) COLLATE utf8_bin NOT NULL,
  m_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  m_email varchar(40) COLLATE utf8_bin NOT NULL,
  m_ver char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  m_gender char(1) COLLATE utf8_bin NOT NULL DEFAULT 'M',
  m_photo varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (m_idx),
  UNIQUE KEY mIdx_UNIQUE (m_idx)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_mentor (
  mento_idx int(11) NOT NULL,
  cate_idx int(11) NOT NULL,
  tor_coin int(11) NOT NULL DEFAULT '0',
  tor_location varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (mento_idx),
  UNIQUE KEY mentoIdx_UNIQUE (mento_idx),
  KEY FK_toti_cate_TO_toti_mentor (cate_idx),
  CONSTRAINT FK_toti_cate_TO_toti_mentor FOREIGN KEY (cate_idx) REFERENCES toti_cate (cate_idx) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_mentor_profile (
  mento_idx int(11) NOT NULL,
  p_shot varchar(500) COLLATE utf8_bin NOT NULL,
  p_pay varchar(255) COLLATE utf8_bin NOT NULL,
  p_edu varchar(255) COLLATE utf8_bin NOT NULL,
  p_career varchar(255) COLLATE utf8_bin NOT NULL,
  p_long varchar(500) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (mento_idx),
  CONSTRAINT mento_idx_fk FOREIGN KEY (mento_idx) REFERENCES toti_mentor (mento_idx) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_question (
  quest_idx int(11) NOT NULL AUTO_INCREMENT,
  cate_idx int(11) NOT NULL,
  quest_name varchar(500) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (quest_idx),
  KEY toti_question_ibfk_1 (cate_idx),
  CONSTRAINT toti_question_ibfk_1 FOREIGN KEY (cate_idx) REFERENCES toti_cate (cate_idx) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_request (
  request_idx int(11) NOT NULL AUTO_INCREMENT,
  m_idx int(11) NOT NULL,
  quest_idx int(11) NOT NULL,
  request_cont varchar(500) COLLATE utf8_bin NOT NULL,
  request_date datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (request_idx),
  KEY toti_request_ibfk_1 (m_idx),
  KEY toti_request_ibfk_2 (quest_idx),
  CONSTRAINT toti_request_ibfk_1 FOREIGN KEY (m_idx) REFERENCES toti_member (m_idx) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT toti_request_ibfk_2 FOREIGN KEY (quest_idx) REFERENCES toti_question (quest_idx) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_review (
  review_idx int(11) NOT NULL AUTO_INCREMENT,
  m_idx int(11) NOT NULL,
  mento_idx int(11) NOT NULL,
  review_star int(11) NOT NULL,
  review_cont varchar(500) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (review_idx),
  KEY toti_review_ibfk_1 (m_idx),
  KEY toti_review_ibfk_2 (mento_idx),
  CONSTRAINT toti_review_ibfk_1 FOREIGN KEY (m_idx) REFERENCES toti_member (m_idx) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT toti_review_ibfk_2 FOREIGN KEY (mento_idx) REFERENCES toti_mentor (mento_idx) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE toti.toti_service (
  service_idx int(11) NOT NULL AUTO_INCREMENT,
  cate_idx int(11) NOT NULL,
  service_name varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (service_idx),
  KEY toti_service_ibfk_1 (cate_idx),
  CONSTRAINT toti_service_ibfk_1 FOREIGN KEY (cate_idx) REFERENCES toti_cate (cate_idx) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin