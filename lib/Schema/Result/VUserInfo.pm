use utf8;
package Schema::Result::VUserInfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::VUserInfo - VIEW

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<v_user_info>

=cut

__PACKAGE__->table("v_user_info");
__PACKAGE__->result_source_instance->view_definition("select `tb1`.`user_id` AS `user_id`,`tb1`.`old_id` AS `old_id`,`tb1`.`sex` AS `sex`,`tb1`.`access` AS `access`,`tb1`.`mail` AS `mail`,`tb1`.`first_name` AS `first_name`,`tb1`.`last_name` AS `last_name`,`tb1`.`patronymic` AS `patronymic`,`tb1`.`fio` AS `fio`,`tb1`.`address` AS `address`,`tb1`.`date_create` AS `date_create`,`tb1`.`date_update` AS `date_update`,`tb1`.`access_delete` AS `access_delete`,`tb2`.`access_id` AS `access_id`,`tb2`.`user_admin_group_id` AS `user_admin_group_id`,`tb3`.`manager_id` AS `manager_id` from ((`hilt`.`user` `tb1` left join `hilt`.`user2admin` `tb2` on((`tb1`.`user_id` = `tb2`.`user_id`))) left join `hilt`.`manager` `tb3` on((`tb1`.`user_id` = `tb3`.`user_id`)))");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 old_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 sex

  data_type: 'integer'
  is_nullable: 1

0 - male
1 - femail

=head2 access

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

0 -  äîñòóï çàêðûò
1 - äîñòóï îòêðûò
2 - äîñòóï çàáëîêèðîâàí

=head2 mail

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 first_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

Èìÿ

=head2 last_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

Ôàìèëèÿ

=head2 patronymic

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 fio

  data_type: 'varchar'
  is_nullable: 0
  size: 500

Ñî ñòàðîãî ñàéòà

=head2 address

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 500

Àäðåñ äîñòàâêè


=head2 date_create

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 date_update

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

Îò÷åñòâî

=head2 access_delete

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 access_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

0 - íå àêòèâíà
1 - àêòèâíà
2 - çàáëîêèðîâàí

=head2 user_admin_group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 manager_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "old_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "sex",
  { data_type => "integer", is_nullable => 1 },
  "access",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "mail",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "first_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "last_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "patronymic",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "fio",
  { data_type => "varchar", is_nullable => 0, size => 500 },
  "address",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 500 },
  "date_create",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "date_update",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "access_delete",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "access_id",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "user_admin_group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "manager_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-19 16:17:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aU8LSBkRqZBbRMcJOhgSfA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
