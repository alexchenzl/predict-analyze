CREATE TABLE predict
(
    hash             char(66) NOT NULL PRIMARY KEY,
    block            bigint   NOT NULL,
    total_touches    int      NOT NULL,
    total_rounds     int      NOT NULL,
    total_accounts   int      NOT NULL,
    total_slots      int      NOT NULL,
    round_batches    jsonb,
    accounts         jsonb,
    slots            jsonb,
    stat_time        bigint,
    matched_accounts int   DEFAULT 0,
    matched_slots    int   DEFAULT 0,
    ratio_accounts   float DEFAULT 0,
    ratio_slots      float DEFAULT 0
);
CREATE INDEX idxbh_p on predict(block, hash);

CREATE TABLE trace
(
    hash           char(66) NOT NULL PRIMARY KEY,
    block          bigint   NOT NULL,
    type           int      NOT NULL,
    status         int      NOT NULL,
    jumpis         int      NOT NULL,
    total_touches  int      NOT NULL,
    total_accounts int      NOT NULL,
    total_slots    int      NOT NULL,
    accounts       jsonb,
    slots          jsonb,
    stat_time      bigint,
    acl            jsonb
);
CREATE INDEX idxbh_t on trace(block, hash);
CREATE INDEX idxgin ON trace USING GIN (acl);