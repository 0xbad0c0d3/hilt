use utf8;
package Schema::Result::Feature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Feature

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<feature>

=cut

__PACKAGE__->table("feature");

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 overflow

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

0 - ?? ??????? ?? ?????
1 - ??????? ??????? ( ???? ? ?????? ? ? ???????? )
2 - ??????? ??????? ( ?????? ??????? ? ???? ? ???????? )

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 title_en

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 date_create

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0




=cut

__PACKAGE__->add_columns(
  "feature_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "overflow",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "title_en",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "date_create",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</feature_id>

=item * L</overflow>

=back

=cut

__PACKAGE__->set_primary_key("feature_id", "overflow");

=head1 UNIQUE CONSTRAINTS

=head2 C<title_UNIQUE>

=over 4

=item * L</title>

=item * L</title_en>

=back

=cut

__PACKAGE__->add_unique_constraint("title_UNIQUE", ["title", "title_en"]);

=head1 RELATIONS

=head2 feature2groups

Type: has_many

Related object: L<Schema::Result::Feature2group>

=cut

__PACKAGE__->has_many(
  "feature2groups",
  "Schema::Result::Feature2group",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product2feature2values

Type: has_many

Related object: L<Schema::Result::Product2feature2value>

=cut

__PACKAGE__->has_many(
  "product2feature2values",
  "Schema::Result::Product2feature2value",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-08-17 13:54:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VUWjsMFqOt6JYAiOsP6hjw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
